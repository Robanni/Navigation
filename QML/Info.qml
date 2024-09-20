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
        ListElement{name: "Аварийный Сигнал"; page: ""}
        ListElement{name: "Рабочие данные"; page: ""}
        ListElement{name: "Цистерна"; page: ""}
        ListElement{name: "Камера"; page: ""}
        ListElement{name: "Инструкционная карта"; page: ""}
        ListElement{name: "Вид на полный масштаб"; page: ""}

    }

    ListView{

        anchors.fill: parent
        model: listModel

        delegate: ButtonForm{

            width: root.width
            height: root.height/6

            nameButton: name
            pageName: page
            onClick: stackview.push(pageName)

        }

    }

}

