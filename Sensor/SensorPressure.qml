import QtQuick
import QtQuick.Controls
import "qrc:/Elements/" as Elements

Item {
    id: root
    width: 1024
    height: 550

    property int index


    Elements.KeyboardDialog{
        id: _dialog

        onReWrite: {

            listModelLabel.setProperty(index,"text",settings.read(key))

        }
    }

    Elements.MyLabel{
        id: _title
        textLabel: "Датчик давления"
        fontPixelSize: 30
        fontBold: true
        anchors{
            horizontalCenter: root.horizontalCenter
            top: root.top
            topMargin: 30
        }
    }

    Elements.MyLabel{
        id: _description
        anchors{
            left: root.left
            leftMargin: 100
            top: _title.bottom
            topMargin: 20
        }
        textLabel: "Диапозон шкалы датчика"
        fontPixelSize: 24
    }

    ListModel{
        id: listModelButtonForm
        ListElement{name:"Мин"; objectName:"MinSensorPressure"}
        ListElement{name:"Макс"; objectName:"MaxSensorPressure"}
    }

    ListView{
        id: listViewButtonForm
        width: 350
        height: 244
        spacing: 50
        model: listModelButtonForm
        delegate: Elements.ButtonForm{
            width: 200
            height: 40
            radius: 0
            nameButton: model.name
            objectName: model.objectName
            onClick:{
                _dialog.key = objectName;
                root.index=index;
                _dialog.open();
                _dialog.mask = "0000"
            }
        }

        x: 156
        y: 120
    }

    ListModel{
        id: listModelLabel
        ListElement{text:""; objectName:"MinSensorPressure"; unit: "бар"}
        ListElement{text:""; objectName:"MaxSensorPressure"; unit: "бар"}
    }

    ListView{
        id: listViewLabel
        width: 350
        height: 244
        spacing: 50
        model: listModelLabel
        delegate: Elements.MyLabel{
            width: 200
            height: 40
            objectName: model.objectName
            textLabel: model.text
            unit: model.unit
            fontPixelSize: 24
            fontBold: true

            Component.onCompleted: {

                listModelLabel.setProperty(index,"text",settings.read(objectName))
            }
        }

        x: 768
        y: 120
    }
}