import QtQuick
import "qrc:/Elements/"

Item{
    id: root
    width: 1024
    height: 600
    Grid{
        columns: 2
        padding: 10
        columnSpacing: 10
        rowSpacing: 70

        ButtonForm{
            objectName: "123"
            width: root.width/2 - 15
            height:  root.height/6
            nameButton: "Новая обработка"
            pageName: "qrc:/QML/NewWork.qml"
            onClick: stackview.push(pageName)
        }

        ButtonForm{
            width: root.width/2 - 15
            height:  root.height/6
            nameButton: "Продолжить обработку"
            pageName: ""
            onClick: stackview.push(pageName)
        }

        ButtonForm{
            width: root.width/2 - 15
            height:  root.height/6
            nameButton: "Настройки опрыскивателя"
            pageName: "qrc:/Settings/SettingsSpraying.qml"
            onClick: stackview.push(pageName)
        }

        ButtonForm{
            width: root.width/2 - 15
            height:  root.height/6
            nameButton: "Настройки антены"
            pageName: "qrc:/Settings/SettingsAntena.qml"
            onClick: stackview.push(pageName)
        }

        ButtonForm{
            width: root.width/2 - 15
            height:  root.height/6
            nameButton: "Отчёты"
            pageName: "qrc:/QML/Info.qml"
            onClick: stackview.push(pageName)
        }

        ButtonForm{
            width: root.width/2 - 15
            height:  root.height/6
            nameButton: "Инструменты тестирования"
            pageName: "qrc:/QML/DevelopmentTools.qml"
            onClick: stackview.push(pageName)
        }
    }

}

//Item {
//    id: root

//    ListModel{
//        id: listModel
//        ListElement {nameWindow: "Начать работу"  ; page: "qrc:/QML/TestTumbler.qml" }
//        ListElement {nameWindow: "Two"  ;  page: "qrc:/QML/Test.qml" }
//        ListElement {nameWindow: "Настройка";  page: "qrc:/QML/Settings.qml" }
//        ListElement {nameWindow: "Инфо" ; page: "qrc:/QML/Info.qml"}

//    }

//    GridView {

//        id: gridView
//        anchors.fill: parent
//        model: listModel
//        width: 1024 ; height: 550
//        cellWidth: 512
//        cellHeight: 275

//        delegate: PageForm{

//            width:  497
//            height: 140

//            name: nameWindow
//            onButtonClick: stackview.push(page)
//            //pageName: page
//        }

//        //highlight: Rectangle{ color: "lightblue" }
//    }
//}
