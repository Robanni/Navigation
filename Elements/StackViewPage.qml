import QtQuick
import QtQuick.Controls

StackView{
    id: stackview
    anchors{
        left: parent.left
        right: parent.right
        top: parent.top
        bottom: toolBar.top
    }
    initialItem: "qrc:/QML/Menu.qml"

    function popPage(){
        stackview.pop()
    }
}




//import QtQuick 2.15
//import QtQuick.Controls
//import QtQuick.Layouts

//StackLayout{

//    id: layoutStack
//    anchors{
//        left: parent.left
//        right: parent.right
//        top: parent.top
//        bottom: toolBar.top
//    }

//    currentIndex: 0

//    function popInfoPage(){

//        if (stackviewInfo.depth===1){
//            layoutStack.currentIndex=0

//        }else{
//            stackviewInfo.pop()
//        }
//    }

//    function popSettingsPage(){

//        if (stackviewSettings.depth===1){
//            layoutStack.currentIndex=0

//        }else{
//            stackviewSettings.pop()
//        }

//    }


//    StackView{
//        id: stackviewWorkBegin

//        initialItem: "qrc:/QML/Menu.qml"
//    }

//    StackView{
//        id: stackviewWorkContinue

//        initialItem: "qrc:/QML/Work.qml"
//    }

//    StackView{
//        id: stackviewSettings

//        initialItem: "qrc:/QML/Settings.qml"
//    }

//    StackView{
//        id: stackviewInfo

//        initialItem: "qrc:/QML/Info.qml"
//    }

//}


