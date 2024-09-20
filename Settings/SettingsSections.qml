import QtQuick
import QtQuick.Controls
import "qrc:/Elements/"
Item {
    id: root
    width: 1024
    height: 550

    property int index
    property var settSprayPage
    KeyboardDialog{
        id: _dialog

        onReWrite: {

            listModel.setProperty(index,"value",settings.read(key))
        }
    }

    Image{
        id: _image
        x: 30
        y: 30
        source: "qrc:/Image/"+_comboboxSectionAmount.currentValue+"section.png"

    }

    MyLabel{
        id: _amountSectionLabel
        textLabel: "Количество секций:"

        x: _image.x
        y: _image.y + _image.height + 40
    }

    MyLabel{
        id: _distanceLabel
        textLabel: "Расстояние между форсунками"

        x: _image.x
        y: _amountSectionLabel.y + _amountSectionLabel.height + 50
    }

    RadioButton{
        id: _radioButton25
        objectName: "DistanceBWInjectors25"
        checked: root.state
        indicator: Rectangle {
            implicitWidth: 40
            implicitHeight: 40
            x: _radioButton25.leftPadding
            y: parent.height / 2 - height / 2
            Text{
                text: "0.25"
                font.bold: true
                font.pixelSize: 15
                color: _radioButton25.checked ? "#17a81a" : "#"
                anchors.centerIn: parent

            }
        }

        Component.onCompleted:{
            if(settings.read(objectName) === "true"){
                checked =  true
            }else{
                checked = false
            }
        }

        Component.onDestruction: {
            settings.write(objectName,checked)
        }

        x: _distanceLabel.x + _distanceLabel.width + 25
        y: _distanceLabel.y - 5

    }

    RadioButton{
        id: _radioButton50
        checked: _radioButton25.checked ? false : true
        objectName: "DistanceBWInjectors50"
        indicator: Rectangle {
            implicitWidth: 40
            implicitHeight: 40
            x: _radioButton50.leftPadding
            y: parent.height / 2 - height / 2
            Text{
                text: "0.5"
                font.bold: true
                font.pixelSize: 15
                color: _radioButton50.checked ? "#17a81a" : "#"
                anchors.centerIn: parent
            }
        }

        x: _radioButton25.x + _radioButton25.width - 17
        y: _distanceLabel.y - 5

    }
    MyLabel{
        id: _labelInjectorShutdown
        textLabel: "Пофорсуночное отключение"

        x: _distanceLabel.x
        y: _distanceLabel.y + _distanceLabel.height + 50
    }

    MySwitch{
        id: _switchInjectorShutdown
        objectName: "InjectorShutdown"
        x: _labelInjectorShutdown.x + _labelInjectorShutdown.width + 35
        y: _labelInjectorShutdown.y
        onCheckedChanged: checked ? _comboboxSectionAmount.currentIndex = 0 : _comboboxSectionAmount.currentIndex = 1
            Component.onCompleted: {
                _comboboxSectionAmount.currentIndex===0 ? checked = true : checked = false
            }

        Component.onDestruction: {
            settings.write(objectName,checked)
        }
    }
    //1 секция включает переключатель пофорсуночное отключение и наоборот при пофорс. отключение выбирается 1 секция
    ComboBox{
        id: _comboboxSectionAmount
        objectName: "SectionAmount"
        model: ["1","2","3","4","5","6","7"]
        height: 40
        width: 45
        x: _amountSectionLabel.x + _amountSectionLabel.width + 20
        y: _amountSectionLabel.y - 10
        onActivated: {
            settings.write(objectName,currentValue)
            currentValue==="1" ? _switchInjectorShutdown.checked = true : _switchInjectorShutdown.checked = false
        }
        Component.onCompleted: {
            if(settings.read(_switchInjectorShutdown.objectName)==="true"){
                currentIndex = indexOfValue("1")
            }else{
                currentIndex = indexOfValue(settings.read(objectName))
            }
        }
        Component.onDestruction: {
            settSprayPage.upd(objectName)
        }

    }

    MyLabel{
        id: _amountInjectorsLabel
        textLabel: "Количество форсунок:"

        x: _image.x + _image.width + 120
        y: _image.y
    }

    ListModel{
        id: listModel
        ListElement{number: 1; value: "10"; objectName: "section1"}
        ListElement{number: 2; value: "10"; objectName: "section2"}
        ListElement{number: 3; value: "10"; objectName: "section3"}
        ListElement{number: 4; value: "10"; objectName: "section4"}
        ListElement{number: 5; value: "10"; objectName: "section5"}
        ListElement{number: 6; value: "10"; objectName: "section6"}
        ListElement{number: 7; value: "10"; objectName: "section7"}

    }

    ListView{
        id: listView
        width:  400
        height: 520
        x: _image.x + _image.width + 80
        y: _amountInjectorsLabel.y + 40

        model: listModel
        spacing: 50

        delegate: Rectangle{



            MyLabel{
                id: _labelSectionNumber
                textColor: _ma.enabled ? "black" : "grey"
                textLabel: number + " секция"
            }

            Rectangle{
                id: injectorsAmount
                height: 30
                width: 30
                border.width: 1

                x: _labelSectionNumber.x + _labelSectionNumber.width + 20
                y: _labelSectionNumber.y

                Text{
                    id: _txt
                    objectName: model.objectName
                    text: value
                    color: _ma.enabled ? "black" : "grey"
                    font.pixelSize: _labelSectionNumber.fontPixelSize
                    anchors.centerIn: parent

                    Component.onCompleted: {
                        listModel.setProperty(index,"value",settings.read(objectName))
                    }
                }

                MouseArea{
                    id: _ma
                    anchors.fill: parent
                    enabled: number>_comboboxSectionAmount.currentValue ? false : true
                    onClicked: {
                        _dialog.key=_txt.objectName;
                        _dialog.mask = "09"
                        root.index=index
                        _dialog.open()
                    }
                }
            }

            MyLabel{
                id: _labeInjectorsNumber
                textLabel: "форсунок"
                textColor: _ma.enabled ? "black" : "grey"
                x: injectorsAmount.x + injectorsAmount.width + 10
                y: _labelSectionNumber.y
            }
        }
    }
    function set(previousPage){
        settSprayPage = previousPage
    }
}
