import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import "qrc:/Elements/"

Item {
    id: root
    width: 1024
    height: 550

    ListModel{
        id: listModel
        ListElement{name: "Тест тамблеров"; page: "qrc:/QML/TestTumbler.qml"}
        ListElement{name: "Тест слайдеров"; page: "qrc:/QML/TestSlider.qml"}
        ListElement{name: "Тест диалогового окна"; page: "qrc:/QML/Test.qml"}
        ListElement{name: "Тест клавы"; page: "qrc:/QML/TestKlava.qml"}
        ListElement{name: "своя клава"; page: "qrc:/Elements/MyVirtualKeyboard.qml"}
        ListElement{name: "Динамическое представление"; page: "qrc:/QML/TestDynamicView.qml"}
        ListElement{name: "ТЕСТ"; page: "qrc:/QML/Test.qml"}

    }

    ListView{

        anchors.fill: parent
        model: listModel

        delegate: ButtonForm{

            width: root.width
            height: root.height/6

            nameButton: name
            pageName: page
            onClick:{stackview.push(pageName)}
        }

    }
}
