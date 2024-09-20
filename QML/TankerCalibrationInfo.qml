import QtQuick
import QtQuick.Controls
import "qrc:/Elements/"

Item {
    width: 1024
    height: 550

    PageName{
        id: namePage
        name: "Калибровка Бака"
    }

    Image{
        id: _image
        x: 200
        y: 100

        source: "qrc:/Image/test2.png"


    }


    ButtonForm{
        width:  424
        height: 65
        x: 300
        y: _image.y + _image.height + 30
        nameButton: "Калибровка"
        pageName: "qrc:/QML/TankerCalibration.qml"
        radius: 0
        onClick:{
            stackview.push(pageName)
        }
    }
}
