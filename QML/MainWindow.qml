import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import "qrc:/Elements/"
import MyClass 1.0

Item {
    id: root
    width: 1024
    height: 600
    property string pageName

    Settings{
        id: settings
    }

//    KeyboardDialog{
//        id: _dialog
//    }


    Image{

        id: backgroundImage
        anchors.fill: root
        source: "qrc:/Image/2.png"
    }

    //#263238

    MyToolBar{

        id: toolBar

        onPopPage: {
            stackview.popPage()
        }
    }

    StackViewPage{
        id: stackview
    }
}
