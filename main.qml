import QtQuick
import QtPositioning
import QtLocation
import QtQuick.Controls

import "OtherQml"

import "ComponentCreator.js" as ComponentCreator

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    property point _currrentPosition: Qt.point(51, 39)
    property double _currrentZoom: 18
    property double _currrentRotation: 0
    property variant _lastRepeator: []

    property int _leftCrossPadding: 0
    property int _rightCrossPadding: 6
    property int _sectionsCount: 6

    property var _sections: []

    Plugin {
        id: mapPlugin
        name: "osm"

        PluginParameter {
            name: "osm.mapping.providersrepository.address"
            value: "http://www.mywebsite.com/osm_repository"
        }
        PluginParameter {
            name: "osm.mapping.cache.directory"
            value: "C:\Users\Robanni\Documents\QtProject\Tiles"
        }
        //PluginParameter { name: "osm.mapping.highdpi_tiles"; value: true }
    }

    Map {
        id: mapView

        anchors.fill: parent
        plugin: mapPlugin

        center: QtPositioning.coordinate(_currrentPosition.x,
                                         _currrentPosition.y)
        zoomLevel: _currrentZoom
        bearing: _currrentRotation

        Transport {
            id: traktor
            anchors.centerIn: parent
            z: 1
            numSections: 6
            sprayerLength: 20
            //traktor.toggleSection({first:false,second:0},status) - так статус секций меняется на противоположный
        }

        MapPolyline {
            id: mapPath
            line.width: 1
            line.color: "black"
        }

        Component {
            id: markerComponent
            MapQuickItem {
                coordinate: QtPositioning.coordinate(0, 0)
                sourceItem: Rectangle {
                    width: 8
                    height: 8
                    color: "red"
                    border.color: "black"
                }
                anchorPoint.x: sourceItem.width / 2
                anchorPoint.y: sourceItem.height / 2
            }
        }

        Component {
            id: mapRect
            MapQuickItem {
                sourceItem: MapRectangle {
                    color: "red"
                    border.color: "black"
                }
            }
        }

        Text {
            text: qsTr(_currrentPosition.x + "    " + _currrentPosition.y)
        }

        Component {
            id: mapPolilyneComponent
            MapPolyline {
                line.width: 5
                line.color: "red"
            }
        }
        Component.onCompleted: {
            createCrossbarPassView(0, _sectionsCount)
        }

        Slider {
            width: 100
            height: 100
            anchors.left: parent.left
            anchors.bottom: parent.bottom

            from: 0
            to: _sectionsCount / 2

            onMoved: {
                _leftCrossPadding = value
                createCrossbarPassView(_leftCrossPadding, _rightCrossPadding)
            }
        }

        Slider {
            width: 100
            height: 100
            anchors.right: parent.right
            anchors.bottom: parent.bottom

            from: 0
            to: _sectionsCount / 2

            onMoved: {
                _rightCrossPadding = _sectionsCount - value
                createCrossbarPassView(_leftCrossPadding, _rightCrossPadding)
            }
        }
    }

    Timer {
        id: requestTimer
        interval: 100
        running: true
        repeat: true
        onTriggered: {
            _currrentPosition = MapHandler.getPosition()
            _currrentRotation = MapHandler.getRotation()

            mapPath.addCoordinate(QtPositioning.coordinate(_currrentPosition.x,
                                                           _currrentPosition.y))

            var _lastIntersection = MapHandler.getLastIntersection()

            addMarker(_lastIntersection.x, _lastIntersection.y)

            var arrayOfCords
            try {
                arrayOfCords = MapHandler.getLastSectionPositions()
            } catch (e) {
                console.error("Error retrieving positions: " + e)
                return
            }

            if (arrayOfCords !== null && arrayOfCords !== undefined) {
                for (var i = _leftCrossPadding; i < _rightCrossPadding; i++) {
                    if (arrayOfCords[i] === undefined)
                        continue
                    if (arrayOfCords[i] === QtPositioning.coordinate(0, 0))
                        continue
                    _lastRepeator[i].addCoordinate(QtPositioning.coordinate(
                                                       arrayOfCords[i].x,
                                                       arrayOfCords[i].y))
                }
            }
        }
    }
    Timer {
        interval: 1000
        running: true
        repeat: true
        onTriggered: {
            //_sections = MapHandler.getSections()
            var sec = MapHandler.getSections()
            console.log("   -   ")
            for (var i = 0; i < sec.length; i++) {

                let a = sec[i].position
                let b = (sec[i].value > 0) ? true : false
                var c = sec[i].value

                console.log(a.first + "      " + a.second + "      " + c)

                traktor.toggleSection(a.first, a.second, b)
            }
            console.log("   -   ")
        }
    }
    Connections {
        target: MapHandler
        function onTransportDataReceived(CrossbarLenght, NumberOfSections) {
            traktor.numSections = NumberOfSections
            traktor.sprayerLength = CrossbarLenght
            _sectionsCount = NumberOfSections
        }
    }

    function addMarker(latitude, longitude) {
        var marker = markerComponent.createObject(mapView)
        marker.coordinate = QtPositioning.coordinate(latitude, longitude)
        mapView.addMapItem(marker)
    }

    function createCrossbarPassView(left, right) {
        _lastRepeator = []
        for (var i = left; i < right; i++) {
            _lastRepeator[i] = mapPolilyneComponent.createObject(mapView)
            mapView.addMapItem(_lastRepeator[i])
        }
    }
}
