import QtQuick
import QtQuick.Controls
import "qrc:/Elements/" as Elements

Item {
    id: root
    Elements.MyLabel{
        id:  _title
        anchors{
            horizontalCenter: root.horizontalCenter
            top: root.top
            topMargin: 30
        }
        textLabel: "Расходомер"
        fontBold: true
        fontPixelSize: 30
    }

    Elements.MyLabel{
        id: _description
        textLabel: "Выход за пределы шкалы расходомера"
        fontPixelSize: 24

        anchors{
            left: root.left
            leftMargin: 20
            top: _title.bottom
            topMargin: 100
        }

    }

    Elements.MySwitch {
        anchors{

            bottom: _description.top
            topMargin: -10
            right: root.right
            rightMargin: 100
        }

        _text: "Звук"
    }

    Elements.MySwitch {
        anchors{
            top: _description.bottom
            bottomMargin: -10
            right: root.right
            rightMargin: 100
        }

        _text: "Мигание"
    }
}
