import QtQuick
import QtQuick.Controls
import "qrc:/Elements/" as Elements

Item{
    id: root
    width: 1024
    height: 550

    property int index
    property var settSprayPage

    Elements.KeyboardDialog{
        id: _dialog

        onReWrite: {
            settSprayPage.upd(manual.objectName)
        }
    }

    Elements.PageName{
        id: namePage
        name: "Бак"
    }

    Elements.ButtonForm{
        id: manual
        width:  500
        height: 65
        x: 45
        y: namePage.y + 100
        nameButton: "Ручной ввод"
        objectName: "Tanker"
        radius: 0
        onClick:{
            _dialog.key=objectName;
            root.index=index
            _dialog.mask = "0009"
            _dialog.open();
        }
        enabled: _switch.checked ? false : true
        textColor:  _switch.checked ? "gray" : "black"
    }

    Elements.MyLabel{
        id: _labelManualTanker
        objectName: "Tanker"
        textLabel: settings.read(objectName)
        anchors{
            left: manual.right
        }
    }

    Elements.ButtonForm{
        id: calibration
        width:  500
        height: 65
        x: 45
        y: manual.y + manual.height + 35
        nameButton: "Калибровка бака"
        pageName: "qrc:/QML/TankerCalibrationInfo.qml"
        radius: 0
        onClick:{
            stackview.push(pageName)
        }
        enabled: _switch.checked ? true : false
        textColor:  _switch.checked ? "black" : "gray"
    }

    Elements.MySwitch{
        id: _switch
        objectName: "SwitchTest"

        anchors{
            horizontalCenter: root.horizontalCenter
            bottom: root.bottom
            bottomMargin: 150
        }

        Text{
            id: _textLeft
            text: "Ручной"
            font.pixelSize: 24
            anchors{
                right: parent.left
            }
        }

        Text{
            id: _textRight
            text: "Датчик"
            font.pixelSize: 24
            anchors{
                left: parent.right
                leftMargin: 5
            }
        }

        Component.onCompleted: {
            if(settings.read(objectName)==="true"){
                checked=true
            }else {
                checked=false
            }
        }

        Component.onDestruction: {
            settings.write(objectName,checked)
        }
    }
    function set(previousPage){
        settSprayPage = previousPage
    }
}
