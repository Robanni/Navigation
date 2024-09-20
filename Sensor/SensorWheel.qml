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

            _label.textLabel=settings.read(key);

        }
    }

    Elements.MyLabel{
        id: _title
        textLabel: "Датчик Колеса"
        fontPixelSize: 30
        fontBold: true
        anchors{
            horizontalCenter: root.horizontalCenter
            top: root.top
            topMargin: 30
        }
    }

    Elements.ButtonForm{
        id: _button
        width: 200
        height: 40
        radius: 0
        nameButton: "Постоянная"
        objectName: "ConstantSensorWheel"
        onClick:{
            _dialog.key = objectName;
            _dialog.open();
            _dialog.mask = "0000"
        }

        anchors{
            top: _title.bottom
            left:  root.left
            topMargin: 90
            leftMargin: 156
        }
        textColor: _switch.checked ? "gray" : "black"
        enabled: _switch.checked ? false : true
    }

    Elements.MyLabel{
        id: _descriptionSwitch
        anchors{
            left: root.left
            leftMargin: 20
            top: _button.bottom
            topMargin: 50
        }
        textLabel: "Источник данных о скорости"
        fontPixelSize: 24
    }

    Elements.MyLabel{
        id: _label
        width: 200
        height: 40
        textLabel: ""
        objectName: "ConstantSensorWheel"
        unit: "см/имп"
        fontPixelSize: 24
        fontBold: true
        x: 768
        y: 120

        Component.onCompleted: {

            textLabel=settings.read(objectName)
        }
    }

    Elements.MySwitch {
        id: _switch
        objectName: "SpeedSource"
        anchors{
            horizontalCenter: _descriptionSwitch.horizontalCenter
            top: _descriptionSwitch.bottom
            topMargin: 20
        }

        _text: "Датчик/GNSS"

        Component.onCompleted: {
            if(settings.read(objectName)==="true"){
                checked=true
            }else{
                checked=false
            }
        }

        Component.onDestruction: {
            settings.write(objectName,checked)
        }
    }
}
