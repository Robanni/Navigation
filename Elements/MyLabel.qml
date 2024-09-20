import QtQuick
import QtQuick.Controls

Label{
    id: _label
    width: txt.width

    property alias textLabel: txt.text
    property alias textHeight: txt.height
    property alias backgroundColor: background.color
    property alias fontPixelSize: txt.font.pixelSize
    property alias fontBold: txt.font.bold
    property alias textColor: txt.color
    property alias unit: txtUnit.text

    Text{
        id: txt
        font.pixelSize: 20
        anchors.centerIn: parent
        text: ""
    }

    Text{
       id: txtUnit
       font.pixelSize: txt.font.pixelSize
       font.bold: true
       x: txt.x + txt.width + 10
       y: txt.y
       text: ""
    }

    background: Rectangle{
        id: background
        //border.width: 1
        color: "#00a2e8"
    }
}

