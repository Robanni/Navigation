import QtQuick
import QtQuick.Controls

Label{
    width: 1024
    height: 50
    y: 10
    property alias name: txt.text

    Text{
        id: txt
        anchors.centerIn: parent
        text: ""
        font.bold: true
        font.pixelSize: 32

    }

}
