import QtQuick
import QtQuick.Controls
import QtQuick.VirtualKeyboard
import "qrc:/Elements/"

Item{
    id: root

    Popup {
        id: popup
        x: 100
        y: 100
        width: 200
        height: 300
        modal: true
        focus: true
        closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutsideParent
    }

    Rectangle{
        anchors.centerIn: parent
        width: 600
        height: 250

        Text{
            anchors{
                left: parent.left
                leftMargin: 20
                top: parent.top
                topMargin: parent.height / 2 - text.height /2
            }
            text: "Text"
            font.pixelSize: 24
        }

        MouseArea{
            anchors.fill: parent
            onClicked: popup.open()
        }
    }

}
