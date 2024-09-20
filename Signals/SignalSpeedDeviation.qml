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
            _buttonMaxSpeed.nameButton = "+" + settings.read(_buttonMaxSpeed.objectName)
            _buttonMinSpeed.nameButton = "-" + settings.read(_buttonMinSpeed.objectName)
        }
    }

    Label{
        id:  _title
        anchors{
            horizontalCenter: root.horizontalCenter
            top: root.top
            topMargin: 30
        }
        text: "Отклонение скорости"
        font.bold: true
        font.pixelSize: 30
    }

    Elements.MyLabel{
        id: _description
        textLabel: "Включение сигнализации при отклонении" + "\n" +
                   "от минимального и максимального значения"
        fontPixelSize: 24
        anchors{
            left: root.left
            leftMargin: 20
            top: _title.bottom
            topMargin: 50
        }
    }

    Elements.MyLabel{
        id: _descriptionMax
        textLabel: "Максимальная скорость"
        fontPixelSize: 24
        anchors{
            left: root.left
            leftMargin: 20
            bottom: _buttonMaxSpeed.top
            bottomMargin: 20
        }
    }

    Elements.ButtonForm{
        id: _buttonMaxSpeed
        width: 130
        height: 50
        anchors{
            top: _description.bottom
            left:  root.left
            topMargin: 90
            leftMargin: 100
        }

        radius: 0
        objectName: "MaxDeviationSpeed"
        nameButton: settings.read(objectName)
        onClick:{
            _dialog.open()
            _dialog.key = objectName

        }

        Text{
            id: _textMaxSpeed
            anchors.left: _buttonMaxSpeed.right
            anchors.leftMargin: 10
            anchors.top: _buttonMaxSpeed.top
            anchors.topMargin: (_buttonMaxSpeed.height  - height) / 2
            font.pixelSize: 30
            text: "км/ч"
        }
    }

    Elements.MyLabel{
        id: _descriptionMin
        textLabel: "Минимальная скорость"
        fontPixelSize: 24
        anchors{
            left: root.left
            leftMargin: 20
            bottom: _buttonMinSpeed.top
            bottomMargin: 20
        }

    }

    Elements.ButtonForm{
        id: _buttonMinSpeed
        width: 130
        height: 50
        anchors{
            top: _buttonMaxSpeed.bottom
            left:  root.left
            topMargin: 50
            leftMargin: 100
        }
        radius: 0
        objectName: "MinDeviationSpeed"
        nameButton: settings.read(objectName)
        onClick:{
            _dialog.open()
            _dialog.key = objectName

        }

        Text{
            id: _textMinSpeed
            anchors.left: _buttonMinSpeed.right
            anchors.leftMargin: 10
            anchors.top: _buttonMinSpeed.top
            anchors.topMargin: (_buttonMinSpeed.height  - height) / 2
            font.pixelSize: 30
            text: "км/ч"
        }
    }

    Elements.MySwitch {
        anchors{
            verticalCenter:    _buttonMaxSpeed.verticalCenter
            right: root.right
            rightMargin: 100
        }

        _text: "Звук"
    }

    Elements.MySwitch {
        anchors{
            verticalCenter:    _buttonMinSpeed.verticalCenter
            right: root.right
            rightMargin: 100
        }

        _text: "Мигание"
    }
}
