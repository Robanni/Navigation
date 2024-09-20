import QtQuick
import QtQuick.Controls
import "qrc:/Elements/"

Item {
    id: root
    width: 1024
    height: 550


    KeyboardDialog{
        id: _dialog

    }

    ButtonForm{
        id: _button
        x:  200
        y: 100
        height: 100
        width: 100
        onClick: {
         _dialog.key = "Test"
            _dialog.open()

        }
    }

    MyLabel{
        id: _lbl
        anchors.right: _button.left
        anchors.leftMargin: 50
        objectName: "Test"
        height: 100

        textLabel: ""
        fontPixelSize: 24
        fontBold: true
        Component.onCompleted: {
            textLabel = settings.read(objectName)
        }
    }
}
