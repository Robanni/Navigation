import QtQuick
import QtLocation
import QtPositioning


Window
{
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    property point _currrentPosition: Qt.point(51,39)
    property double _currrentZoom:20
    property double _currrentRotation:0



    Plugin
    {
        id:mapPlugin
        name: "osm"

        PluginParameter { name: "osm.mapping.providersrepository.address"; value: "http://www.mywebsite.com/osm_repository" }
        PluginParameter { name: "osm.mapping.cache.directory"; value: "C:\Users\Robanni\Documents\QtProject\Tiles" }

        //PluginParameter { name: "osm.mapping.highdpi_tiles"; value: true }
    }


    Map
    {
        id: mapView

        anchors.fill: parent
        plugin: mapPlugin

        center: QtPositioning.coordinate(_currrentPosition.x,_currrentPosition.y)
        zoomLevel: _currrentZoom
        bearing: _currrentRotation

        MapPolyline
        {
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

        Text
        {
            text: qsTr(_currrentPosition.x + "    " + _currrentPosition.y)
        }
        Rectangle
        {
            anchors.centerIn: parent

            color: "red"
            width: 20
            height: 20
        }
    }

    Timer
    {
        id: requestTimer
        interval: 100
        running: true
        repeat: true
        onTriggered:
        {
            _currrentPosition = MapHandler.getPosition()
            _currrentRotation = MapHandler.getRotation()

            mapPath.addCoordinate(QtPositioning.coordinate(_currrentPosition.x,_currrentPosition.y))

            var _lastIntersection = MapHandler.getLastIntersection()
            console.log(_lastIntersection)
            addMarker(_lastIntersection.x,_lastIntersection.y)


        }
    }
    function addMarker(latitude,longitude) {
        var marker = markerComponent.createObject(mapView);
        marker.coordinate = QtPositioning.coordinate(latitude, longitude);
        mapView.addMapItem(marker);
    }

}
