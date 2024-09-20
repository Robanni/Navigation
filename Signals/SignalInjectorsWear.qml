import QtQuick
import QtQuick.Controls
import "qrc:/Elements/" as Elements

Item{
    id: root
    width: 1024
    height: 550

    property int index

    Elements.KeyboardDialog{
        id: _dialog

        onReWrite: {
            _buttonInjectorsWear.nameButton = settings.read(_buttonInjectorsWear.objectName)
        }
    }

    Elements.MyLabel{
        id: _title
        textLabel: "Контроль износа форсунок"
        fontBold: true
        fontPixelSize: 30
        anchors{
            horizontalCenter: root.horizontalCenter
            top: root.top
            topMargin: 30
        }
    }

    Elements.MyLabel{
        id: _description
        textLabel: "Включение сигнализации при отклонении от" + "\n" +
                   "нормы износа форсунок"
        fontPixelSize: 24
        anchors{
            top: _title.bottom
            topMargin: 70
            left: root.left
            leftMargin: 100

        }
    }

    Elements.ButtonForm{
        id: _buttonInjectorsWear
        width: 130
        height: 50
        radius: 0
        objectName: "InjectorsWearMonitoring"
        nameButton: settings.read(objectName)
        anchors{
            top: _description.bottom
            topMargin: 100
            left: root.left
            leftMargin: 100
        }

        onClick:{
            _dialog.open()
            _dialog.key = objectName
            _dialog.mask = "000"

        }

        Text{
            id: _text
            anchors.left: _buttonInjectorsWear.right
            anchors.leftMargin: 10
            anchors.top: _buttonInjectorsWear.top
            anchors.topMargin: (_buttonInjectorsWear.height  - height) / 2
            font.pixelSize: 30
            text: "%"
        }
    }

    Elements.MySwitch {
        anchors{

            top: _buttonInjectorsWear.top
            topMargin: -10
            right: root.right
            rightMargin: 100
        }
        _text: "Звук"

    }

    Elements.MySwitch {
        _text: "Мигание"
        anchors{
            bottom: _buttonInjectorsWear.bottom
            bottomMargin: -10
            right: root.right
            rightMargin: 100
        }
    }
}
