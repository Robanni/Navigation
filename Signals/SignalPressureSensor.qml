import QtQuick
import QtQuick.Controls
import "qrc:/Elements/" as Elements

Item {
    id: root
    width: 1024
    height: 550

    Elements.MyLabel{
        id:  _title
        anchors{
            horizontalCenter: root.horizontalCenter
            top: root.top
            topMargin: 30
        }
        textLabel: "Датчик давления"
        fontBold: true
        fontPixelSize: 30
    }
    Elements.MyLabel{
        id: _descriptionOne
        textLabel: "Выход за пределы шкалы" + "\n" +
                   "датчика давления"
        fontPixelSize: 24
        anchors{
            left: root.left
            leftMargin: 100
            top: _title.bottom
            topMargin: 100
        }
    }

    Elements.MySwitch {
        anchors{
            bottom: _descriptionOne.top
            right: root.right
            rightMargin: 100
        }
        _text: "Звук"
    }

    Elements.MySwitch {
        anchors{
            top: _descriptionOne.bottom
            right: root.right
            rightMargin: 100
        }

        _text: "Мигание"
    }

    Elements.MyLabel{
        id: _descriptionTwo
        textLabel: "Отклонения давления от" + "\n" +
                   "благоприятного для выбраной форсунки"
        fontPixelSize: 24
        anchors{
            left: root.left
            leftMargin: 100
            top: _descriptionOne.bottom
            topMargin: 200
        }
    }

    Elements.MySwitch {
        anchors{
            bottom: _descriptionTwo.top
            right: root.right
            rightMargin: 100
        }

        _text: "Звук"
    }

    Elements.MySwitch {
        anchors{
            top: _descriptionTwo.bottom
            right: root.right
            rightMargin: 100
        }

        _text: "Мигание"
    }
}
