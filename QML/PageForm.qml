import QtQuick 2.15

Rectangle {

    property alias name: txt.text

    property var pageName
    signal buttonClick()

    border.width: 1

    Text{
        id: txt
        font.pixelSize: 20
        text: ""
        anchors.centerIn: parent
    }

    MouseArea{
        id: ma
        anchors.fill: parent
        onClicked: buttonClick()//stackview.push(pageName)
    }
}

