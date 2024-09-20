import QtQuick
import QtQuick.Controls
import "qrc:/Elements/"
import "qrc:/Signals/" as Signals
Item{
    id: root

    SwipeView {
        id: _swipeView

        currentIndex: 0
        anchors.fill: parent

        Signals.SignalSprayingNorm{
            id: _sprayingNorm
        }

        Signals.SignalSectionOverlap{
            id: _sectionOverlap

        }

        Signals.SignalSpeedDeviation{
            id: _speedDeviation
        }

        Signals.SignalPressureSensor{
            id: _pressureSensor
        }

        Signals.SignalFlowMeterSensor{
            id: _flowMeterSensor
        }

        Signals.SignalInjectorsWear{
            id: _injectorsWear
        }

        Signals.SignalMinTankerLevel{
            id: _minTankerLevel
        }

        Signals.SignalSputnik{
            id: _sputnik
        }
    }

    PageIndicator {
        id: indicator

        count: _swipeView.count
        currentIndex: _swipeView.currentIndex

        delegate: Rectangle {
            implicitWidth: 26
            implicitHeight: 26

            radius: 13
            required property int index
            Rectangle {
                width: 14
                height: 14
                x: 6
                y: 6
                radius: 7
                color: "black"
                visible: index===indicator.currentIndex
            }
        }

        anchors.bottom: _swipeView.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        spacing: 50
    }

}

//Item {
//    width: 1024
//    height: 550

//    PageName{
//        id: namePage
//        name: "Предупреждающие Сигналы"
//    }

//    Loader{
//        id: _loader
//        source: "qrc:/QML/SignalSprayingNorm.qml"
//    }

//    Rectangle{
//        x: 512 - _row.width / 2
//        y: 490
//        Row{
//            id: _row
//            spacing:50

//            RadioButton{
//                id: _radioButtonSignalSprayingNorm
//                checked: true
//                onClicked:{
//                    if(checked){
//                        _loader.source = "qrc:/QML/SignalSprayingNorm.qml"
//                    }
//                }

//                indicator: Rectangle {
//                    implicitWidth: 26
//                    implicitHeight: 26
//                    x: _radioButtonSignalSprayingNorm.leftPadding
//                    y: parent.height / 2 - height / 2
//                    radius: 13

//                    Rectangle {
//                        width: 14
//                        height: 14
//                        x: 6
//                        y: 6
//                        radius: 7
//                        color: "black"
//                        visible: _radioButtonSignalSprayingNorm.checked
//                    }
//                }
//            }
//            RadioButton{
//                id: _radioButtonSignalSectionOverlap
//                onClicked:{
//                    if(checked){
//                        _loader.source = "qrc:/QML/SignalSectionOverlap.qml"
//                    }
//                }

//                indicator: Rectangle {
//                    implicitWidth: 26
//                    implicitHeight: 26
//                    x: _radioButtonSignalSectionOverlap.leftPadding
//                    y: parent.height / 2 - height / 2
//                    radius: 13

//                    Rectangle {
//                        width: 14
//                        height: 14
//                        x: 6
//                        y: 6
//                        radius: 7
//                        color: "black"
//                        visible: _radioButtonSignalSectionOverlap.checked
//                    }
//                }
//            }
//            RadioButton{
//                id: _radioButtonSignalSpeedDeviation
//                onClicked:{
//                    if(checked){
//                        _loader.source = "qrc:/QML/SignalSpeedDeviation.qml"
//                    }
//                }
//                indicator: Rectangle {
//                    implicitWidth: 26
//                    implicitHeight: 26
//                    x: _radioButtonSignalSpeedDeviation.leftPadding
//                    y: parent.height / 2 - height / 2
//                    radius: 13

//                    Rectangle {
//                        width: 14
//                        height: 14
//                        x: 6
//                        y: 6
//                        radius: 7
//                        color: "black"
//                        visible: _radioButtonSignalSpeedDeviation.checked
//                    }
//                }
//            }
//            RadioButton{
//                id: _radioButtonSignalPressureSensor
//                onClicked:{
//                    if(checked){
//                        _loader.source = "qrc:/QML/SignalPressureSensor.qml"
//                    }
//                }
//                indicator: Rectangle {
//                    implicitWidth: 26
//                    implicitHeight: 26
//                    x: _radioButtonSignalPressureSensor.leftPadding
//                    y: parent.height / 2 - height / 2
//                    radius: 13

//                    Rectangle {
//                        width: 14
//                        height: 14
//                        x: 6
//                        y: 6
//                        radius: 7
//                        color: "black"
//                        visible: _radioButtonSignalPressureSensor.checked
//                    }
//                }
//            }
//            RadioButton{
//                id: _radioButtonSignalFlowMeterSensor
//                onClicked:{
//                    if(checked){
//                        _loader.source = "qrc:/QML/SignalFlowMeterSensor.qml"
//                    }
//                }
//                indicator: Rectangle {
//                    implicitWidth: 26
//                    implicitHeight: 26
//                    x: _radioButtonSignalFlowMeterSensor.leftPadding
//                    y: parent.height / 2 - height / 2
//                    radius: 13

//                    Rectangle {
//                        width: 14
//                        height: 14
//                        x: 6
//                        y: 6
//                        radius: 7
//                        color: "black"
//                        visible: _radioButtonSignalFlowMeterSensor.checked
//                    }
//                }
//            }

//            RadioButton{
//                id: _radioButtonSignalSputnik
//                onClicked:{
//                    if(checked){
//                        _loader.source = "qrc:/QML/SignalSputnik.qml"
//                    }
//                }
//                indicator: Rectangle {
//                    implicitWidth: 26
//                    implicitHeight: 26
//                    x: _radioButtonSignalSputnik.leftPadding
//                    y: parent.height / 2 - height / 2
//                    radius: 13

//                    Rectangle {
//                        width: 14
//                        height: 14
//                        x: 6
//                        y: 6
//                        radius: 7
//                        color: "black"
//                        visible: _radioButtonSignalSputnik.checked
//                    }
//                }
//            }

//            RadioButton{
//                id: _radioButtonSignalInjectorsWear
//                onClicked:{
//                    if(checked){
//                        _loader.source = "qrc:/QML/SignalInjectorsWear.qml"
//                    }
//                }
//                indicator: Rectangle {
//                    implicitWidth: 26
//                    implicitHeight: 26
//                    x: _radioButtonSignalInjectorsWear.leftPadding
//                    y: parent.height / 2 - height / 2
//                    radius: 13

//                    Rectangle {
//                        width: 14
//                        height: 14
//                        x: 6
//                        y: 6
//                        radius: 7
//                        color: "black"
//                        visible: _radioButtonSignalInjectorsWear.checked
//                    }
//                }
//            }

//            RadioButton{
//                id: _radioButtonSignalMinTankerLevel
//                onClicked:{
//                    if(checked){
//                        _loader.source = "qrc:/QML/SignalMinTankerLevel.qml"
//                    }
//                }
//                indicator: Rectangle {
//                    implicitWidth: 26
//                    implicitHeight: 26
//                    x: _radioButtonSignalMinTankerLevel.leftPadding
//                    y: parent.height / 2 - height / 2
//                    radius: 13

//                    Rectangle {
//                        width: 14
//                        height: 14
//                        x: 6
//                        y: 6
//                        radius: 7
//                        color: "black"
//                        visible: _radioButtonSignalMinTankerLevel.checked
//                    }
//                }
//            }
//        }
//    }
//}
