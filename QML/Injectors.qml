import QtQuick
import QtQuick.Controls
import Qt.labs.qmlmodels
import "qrc:/Elements/"

Item{
    id: root
    width: 1024
    height: 550

    property var settPage
    function set(previousPage){
        settPage = previousPage
    }

    Rectangle{
        id: header
        width: 1024
        height: 50

        Rectangle{
            id: _type
            width: 324
            height: parent.height
            x: 0
            y: 0
            border.width: 1

            Text{
                anchors.centerIn: parent
                text: "ТИП"
                font.pixelSize: 18
                font.bold: true
            }
        }

        Rectangle{
            id: _color
            width: 100
            height: parent.height
            x: 324
            y: 0
            border.width: 1

            Text{
                anchors.centerIn: parent
                text: "ЦВЕТ"
                font.pixelSize: 18
                font.bold: true
            }
        }

        Rectangle{
            id: _flow
            width: 200
            height: parent.height
            x: 424
            y: 0
            border.width: 1


            Text{
                anchors.centerIn: parent
                text: "             РАСХОД \n ПРИ ПЕРЕПАДЕ 3 БАР"
                font.pixelSize: 18
                font.bold: true
            }
        }

        Rectangle{
            id: _min
            width: 200
            height: parent.height
            x: 624
            y: 0
            border.width: 1

            Text{
                anchors.centerIn: parent
                text: "МИН. ДАВЛЕНИЕ"
                font.pixelSize: 18
                font.bold: true
            }
        }

        Rectangle{
            id: _max
            width: 200
            height: parent.height
            x: 824
            y: 0
            border.width: 1

            Text{
                anchors.centerIn: parent
                text: "МАКС. ДАВЛЕНИЕ"
                font.pixelSize: 18
                font.bold: true
            }
        }
    }

    Flickable{
        width: 1024
        height: 500
        contentWidth: 1024
        contentHeight: 65*12
        x: 0
        y: 50
        clip: true

        ListModel{
            id: listModel
            ListElement{name: "ISO001";}
            ListElement{name: "ISO0015";}
            ListElement{name: "ISO002";}
            ListElement{name: "ISO025";}
            ListElement{name: "ISO003";}
            ListElement{name: "ISO004";}
            ListElement{name: "ISO005";}
            ListElement{name: "ISO006";}
            ListElement{name: "ISO008";}
            ListElement{name: "ISO010";}
            ListElement{name: "ISO015";}
            ListElement{name: "Пользовательская форсунка"; pageName: "qrc:/QML/CustomInjectorsSettings.qml";}
        }

        ListView{
            id: listView
            width: 324
            height: 65*12
            objectName: "Injector"
            x: 0
            y: 0
            clip: true
            interactive: false
            model: listModel

            delegate: ButtonForm{
                width: 324
                height: 65
                radius: 0
                nameButton: model.name
                pageName: model.pageName
                onClick: {
                    if(index==11) {
                        stackview.push(pageName).set(root)
                        //previousPage.upd()
                    }
                    else {
                        settings.write("Injector",nameButton)
                        settPage.upd("Injector")
                        stackview.pop()

                    }

                }
            }
        }


        ListModel{
            id: colorListModel
            ListElement{color: "orange"}
            ListElement{color: "green"}
            ListElement{color: "yellow"}
            ListElement{color: "indigo"}
            ListElement{color: "blue"}
            ListElement{color: "red"}
            ListElement{color: "brown"}
            ListElement{color: "grey"}
            ListElement{color: "white"}
            ListElement{color: "lightblue"}
            ListElement{color: "lightgreen"}
            ListElement{color: "black"}
        }

        ListView{
            id: colorListView
            width: 100
            height: 65*12
            x: 324
            y: 0
            clip: true
            interactive: false
            model: colorListModel

            delegate: Rectangle{
                implicitWidth: 100
                implicitHeight: 65
                border.width: 1
                color: model.color
            }
        }

        TableModel{
            id: _tableModel
            TableModelColumn{display: "flow"}
            TableModelColumn{display: "minPress"}
            TableModelColumn{display: "maxPress"}
            //сделать больше размер
            rows:[
                {flow: 0.4, minPress: 1.5, maxPress: 7},
                {flow: 0.6, minPress: 1.5, maxPress: 7},
                {flow: 0.8, minPress: 1.5, maxPress: 7},
                {flow: 1, minPress: 1.5, maxPress: 7},
                {flow: 1.20, minPress: 1.5, maxPress: 7},
                {flow: 1.60, minPress: 1.5, maxPress: 7},
                {flow: 2, minPress: 1.5, maxPress: 7},
                {flow: 2.40, minPress: 1.5, maxPress: 7},
                {flow: 3.20, minPress: 1.5, maxPress: 7},
                {flow: 4, minPress: 1.5, maxPress: 7},
                {flow: 6, minPress: 1.5, maxPress: 7},
                {flow: settings.read("InjectorCustomFlow"), minPress: settings.read("InjectorCustomMinPressure"), maxPress: settings.read("InjectorCustomMaxPressure")},
            ]
        }

        TableView{
            id: _tableView
            width: 600
            height: 65*12
            x: 424
            y: 0
            clip: true
            interactive: false
            model: _tableModel

            delegate: Rectangle{
                implicitWidth: 200
                implicitHeight: 65
                border.width: 1
                Text{
                    id: txt
                    anchors.centerIn: parent
                    text: model.display
                }
            }
        }
    }
}

