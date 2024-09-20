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
        textLabel: "Наложение секций"
        fontBold: true
        fontPixelSize: 30
    }
    Elements.MyLabel{
        id:  _description
        textLabel: "Включение сигнализации при наложение секций"
        fontPixelSize: 24

        anchors{
            left: root.left
            leftMargin: 20
            top: _title.bottom
            topMargin: 50
        }
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
        objectName: "SectionOverlapMonitoring"
        nameButton: settings.read(objectName)
        onClick:{
            _dialog.open()
            _dialog.key = objectName
            _dialog.mask = "000"
        }

        Text{
            id: _text
            anchors.left: _button.right
            anchors.leftMargin: 10
            anchors.top: _button.top
            anchors.topMargin: (_button.height  - height) / 2
            font.pixelSize: 30
            text: "см"
        }
    }

    Elements.MySwitch {
        _text: "Звук"
        anchors{
            verticalCenter: _button.top
            right: root.right
            rightMargin: 100
            topMargin: -10
        }
    }

    Elements.MySwitch {
        _text: "Мигание"
        anchors{
            verticalCenter: _button.bottom
            right: root.right
            rightMargin: 100
            topMargin: -10
        }
    }
}

//import QtQuick
//import QtQuick.Controls
//import "qrc:/Elements/"

//Item {

//    Label{
//        id: _label
//        x: 30
//        y: 90
//        text: "НАЛОЖЕНИЕ СЕКЦИЙ"
//        font.bold: true
//        font.pixelSize: 20
//    }

//    ButtonForm{
//        x: (_label.x + _label.width) / 4
//        y: 125
//        width: txtWidth + 10
//        height: txtHeigh + 10
//        radius: 0
//        nameButton: "РЕДАКТИРОВАТЬ"
//    }

//    MySwitch {
//        x:900 - textWidth
//        y:90

//        _text: "Звук"
//    }

//    MySwitch {
//        x:900 - textWidth
//        y:130

//        _text: "Мигание"
//    }

//}
