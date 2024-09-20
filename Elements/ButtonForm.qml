import QtQuick
import QtQuick.Controls

Rectangle {
    id:root

    signal click()

    property alias nameButton: txt.text
    property alias textColor: txt.color
    property real txtWidth: txt.width
    property real txtHeigh: txt.height
    property var pageName

    border.width: 1
    radius: 25

    Text{
        id: txt
        font.pixelSize: 20
        text: ""
        anchors.centerIn: parent
    }

    MouseArea{
        id: _mousearea
        anchors.fill: parent
        onClicked: click()

    }
}

