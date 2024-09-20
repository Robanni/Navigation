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
        mask: "B00"
        onReWrite: {

            _buttonPlus.nameButton = "+" + settings.read(_buttonPlus.objectName)
            _buttonMinus.nameButton = "-" + settings.read(_buttonMinus.objectName)
        }
    }

    Elements.MyLabel{
        id:  _title
        anchors{
            horizontalCenter: root.horizontalCenter
            top: root.top
            topMargin: 30
        }
        textLabel: "Отклонение нормы вылива"
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
        textLabel: "Включение сигнализации при отклонении от нормы вылива"
        fontPixelSize: 24
    }

    Elements.ButtonForm{
        id: _buttonPlus
        width: 130
        height: 50
        anchors{
            top: _description.bottom
            left:  root.left
            topMargin: 50
            leftMargin: 100
        }
        radius: 0
        objectName: "DeviationSprayingNormPlus"
        nameButton: "+" + settings.read(objectName)

        onClick:{
            _dialog.open()
            _dialog.key = objectName

        }

        Text{
            id: _textPlus
            anchors.left: _buttonPlus.right
            anchors.leftMargin: 10
            anchors.top: _buttonPlus.top
            anchors.topMargin: (_buttonPlus.height  - height) / 2
            font.pixelSize: 30
            text: "%"
        }
    }

    Elements.ButtonForm{
        id: _buttonMinus
        width: 130
        height: 50
        anchors{
            top: _buttonPlus.bottom
            left:  root.left
            topMargin: 50
            leftMargin: 100
        }
        radius: 0
        objectName: "DeviationSprayingNormMinus"
        nameButton: "-" + settings.read(objectName)

        onClick:{
            _dialog.open()
            _dialog.key = objectName

        }

        Text{
            id: _textMinus
            anchors.left: _buttonMinus.right
            anchors.leftMargin: 10
            anchors.top: _buttonMinus.top
            anchors.topMargin: (_buttonMinus.height  - height) / 2
            font.pixelSize: 30
            text: "%"
        }
    }

    Elements.MySwitch {
      anchors{
       verticalCenter:    _buttonPlus.verticalCenter
       right: root.right
       rightMargin: 100
      }

        _text: "Звук"
    }

    Elements.MySwitch {
        anchors{
         verticalCenter:    _buttonMinus.verticalCenter
         right: root.right
         rightMargin: 100
        }

        _text: "Мигание"
    }
}

