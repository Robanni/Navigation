import QtQuick 2.6
import QtQuick.Window 2.0
import QtQuick.Controls 2.0
import QtQuick.VirtualKeyboard 2.0
//import QtQuick.VirtualKeyBoardSettings

//   C:\Qt\6.2.0\mingw81_64\qml

Item {
    id:root
    width: 1024
    height: 550
    Rectangle{

        width: 1024
        height: 550

        TextField {
            id: textInput
            x: 150
            y: 50
            width: 150
            height: 30
            //validator:
            //inputMethodHints: Qt.ImhDigitsOnly
        }

        Button{
            id: button
            text: "ok"
            x: 250
            y: 50
            onClicked: print(ip.Sca)
        }

        InputPanel {
            id: ip
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom
            height: 400
            width: 400

            //Component.onCompleted: console.log(Object.keys(ip.keyboard.style).sort())
        }

        Slider {
            id: sl
            from: 0
            to: 3000
        }

        Binding {
            target: ip.keyboard.style
            property: 'keyboardDesignHeight'
            value: sl.value

        }
    }
}
