import QtQuick
import QtQuick.Controls
import "qrc:/Elements/"

Item {
    width: 1024
    height: 550

    PageName{
        id: namePage
        name: "Настройки Антены"
    }

    ButtonForm{
        width:  500
        height: 65
        x: 45
        y: namePage.y + 100
        nameButton: "Самоходный опрыскиватель"
        pageName: "qrc:/QML/SprayerSelf-propelled.qml"
        radius: 0
        onClick: stackview.push(pageName)
    }

    ButtonForm{
        width:  500
        height: 65
        x: 45
        y: namePage.y + 200
        nameButton: "Прицепной опрыскиватель"
        pageName: "qrc:/QML/SprayerTrailed.qml"
        radius: 0
        onClick: stackview.push(pageName)
    }
}
