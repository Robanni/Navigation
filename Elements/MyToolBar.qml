import QtQuick
import QtQuick.Controls

Rectangle {
    id: toolBar
    //width: parent.width
    height: 50
    signal popPage()

    anchors{
        left: parent.left
        right: parent.right
        //top: parrent.bottom
        bottom: parent.bottom
    }

    //color: "black"
    color: Qt.rgba(0,0,0,0)

    Row{
        id: buttonRow
        width: toolBar.width
        height: toolBar.height

        spacing: 0

        Button{
            id: buttonBack
            width: parent.width/2
            height: parent.height
            text: "Back"
            onClicked: popPage()

        }

        Button{
            id: buttonHome
            width: parent.width/2
            height: parent.height
            text: "Home"
            onClicked: {
                while (stackview.depth>1){
                    popPage()
                }
            }
        }
    }

}


//popPage("qrc:/QML/Menu.qml")
