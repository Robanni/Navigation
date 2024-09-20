import QtQuick
import "qrc:/Elements/"

Item{
    ListModel{
        id: listModel
        ListElement{name: ""; page: ""}
        ListElement{name: "Опрыскиватель"; page: ""}
        ListElement{name: "Трактор"; page: ""}
        ListElement{name: "Предупреждение"; page: ""}

    }

    ListView{

        anchors.fill: parent
        model: listModel

        delegate: ButtonForm{

            width: parent.width
            height: parent.height/4

            nameButton: name
            pageName: page
        }
    }

}

