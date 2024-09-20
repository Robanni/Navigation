import QtQuick
import QtQuick.Controls
import "qrc:/Elements/"

Item {
    id: root
    width: 1024
    height: 550

    property int index

    KeyboardDialog{
        id: _dialog

        onReWrite: {
            if(index==0||index==3){
                listModelLabel.setProperty(index,"value",settings.read(key))
            }
        }
    }

    //Модель для кнопок в Настройках опрыскивателя
    ListModel{
        id: listModelButtonForm
        ListElement{name: "Норма вылива"; objectName: "OutFlowRate"; mask: "009"}
        ListElement{name: "Форсунки"; objectName: "Injector"; page: "qrc:/QML/Injectors.qml";}
        ListElement{name: "Настройка штанги";objectName: "SectionAmount"; page: "qrc:/Settings/SettingsSections.qml";}
        ListElement{name: "Бак"; page: "qrc:/QML/Tanker.qml";}
        ListElement{name: "Предупреждающие сигналы"; page: "qrc:/QML/WarningSignals.qml";}
        ListElement{name: "Датчики"; page: "qrc:/QML/Sensors.qml";}

    }

    //Представление для кнопок в Настройках опрыскивателя
    ListView{
        id: listViewButtonForm
        width:  400
        height: 520
        x: 30
        y: 30
        model: listModelButtonForm
        spacing: 25

        delegate: ButtonForm{
            width: 400
            height: 60
            nameButton: model.name
            pageName: model.page
            objectName: model.objectName
            onClick: {
                _dialog.key=objectName;
                root.index=index
                _dialog.mask = model.mask

                if(index==0){
                    _dialog.open();
                }else if(index==1){
                    stackview.push(pageName).set(root)
                }else if(index==2){
                    stackview.push(pageName).set(root)
                }else if(index==3){
                    stackview.push(pageName).set(root)
                }else {
                    stackview.push(pageName)
                }
            }
        }
    }

    function upd(objectName){
        switch(objectName){
        case "Injector": listModelLabel.setProperty(1,"value",settings.read(objectName));
            break;
        case "SectionAmount": listModelLabel.setProperty(2,"value",settings.read(objectName))
            break;
        case "Tanker": listModelLabel.setProperty(3,"value",settings.read(objectName))
            break;
        }
    }

    //Модель для лейбла в Настройках опрыскивателя
    ListModel{
        id: listModelLabel

        ListElement{value: ""; objectName: "OutFlowRate"; unit: "л/га"}
        ListElement{value: ""; objectName: "Injector"}
        ListElement{value: ""; objectName: "SectionAmount"; unit: ""}
        ListElement{value: ""; objectName: "Tanker"; unit: "л"}
    }

    //Представление для лейбла в Настройках опрыскивателя
    ListView{
        id: listViewLabel
        width:  400
        height: 550
        model: listModelLabel
        spacing: 25


        delegate: MyLabel{

            id: _lbl
            objectName: model.objectName
            height: 60
            textLabel: model.value
            fontPixelSize: 24
            fontBold: true
            unit: model.unit

            Component.onCompleted: {
                listModelLabel.setProperty(index,"value",settings.read(objectName))
                if(settings.read("SectionAmount")==="3"){listModelLabel.setProperty(2,"unit","секции")}
                else {listModelLabel.setProperty(2,"unit","секций")}
            }

        }
        x: listViewButtonForm.x + listViewButtonForm.width + 400
        y: listViewButtonForm.y

    }

    Switch{
        id: _switchWarningSignalsActive

        x: listViewLabel.x
        y: listViewLabel.y + 340

        indicator: Rectangle {
            implicitWidth: 70
            implicitHeight: 40
            x: _switchWarningSignalsActive.leftPadding
            y: parent.height / 2 - height / 2
            radius: 20
            color: _switchWarningSignalsActive.checked ? "#17a81a" : "#ffffff"
            border.color: _switchWarningSignalsActive.checked ? "#17a81a" : "#cccccc"

            Rectangle {
                x: _switchWarningSignalsActive.checked ? parent.width - width : 0
                width: 40
                height: 40
                radius: 20
                color: _switchWarningSignalsActive.down ? "#cccccc" : "#ffffff"
                border.color: _switchWarningSignalsActive.checked ? (_switchWarningSignalsActive.down ? "#17a81a" : "#21be2b") : "#999999"
            }
        }

        Component.onCompleted: {
            if(settings.read(objectName)==="true"){
                checked = true
            }else{
                checked = false
            }
        }

        Component.onDestruction: {
            settings.write(objectName,checked)
        }


    }

    //    Dialog{
    //        id: _injectorsDialog
    //        width: root.width
    //        height: root.height
    //        anchors.centerIn: parent

    //        Injectors{
    //            id: test
    //            anchors.centerIn: parent
    //            onChooseInjectros:{
    //                _injectorsDialog.close()
    //                listModelLabel.setProperty(1,"value",settings.read("Injector"))
    //            }
    //        }
    //    }

}

