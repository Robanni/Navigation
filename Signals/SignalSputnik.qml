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
                  _button.nameButton = settings.read(_button.objectName)
        }
    }
    Elements.MyLabel{
        id:  _title
        anchors{
            horizontalCenter: root.horizontalCenter
            top: root.top
            topMargin: 30
        }
        textLabel: "Спутник"
        fontBold: true
        fontPixelSize: 30
    }
    Elements.MyLabel{
        id: _description
        anchors{
            left: root.left
            leftMargin: 20
            top: _title.bottom
            topMargin: 50
        }
        textLabel: "Включение сигнализации при снижении количества спутников"
        fontPixelSize: 24
    }

    Elements.ButtonForm{
        id: _button
        width: 130
        height: 50
        anchors{
            top: _description.top
            left:  _description.left
            topMargin: 100
            leftMargin: 100
        }
        radius: 0
        objectName: "SputnikAmount"
        nameButton: settings.read(objectName)
        onClick:{
            _dialog.open()
            _dialog.key = objectName
            _dialog.mask = "00"

        }

        Text{
            id: _text
            anchors.left: _button.right
            anchors.leftMargin: 10
            anchors.top: _button.top
            anchors.topMargin: (_button.height  - height) / 2
            font.pixelSize: 30
            text: "спутников"
        }
    }

    Elements.MySwitch {
        anchors{
            verticalCenter: _button.top
            right: root.right
            rightMargin: 100
            topMargin: -10
        }

        _text: "Звук"
    }

    Elements.MySwitch {
        anchors{
            verticalCenter: _button.bottom
            right: root.right
            rightMargin: 100
            topMargin: -10
        }

        _text: "Мигание"
    }
}
