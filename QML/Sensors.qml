import QtQuick
import QtQuick.Controls
import "qrc:/Elements/"
import "qrc:/Sensor/"
Item{
    id: root

    SwipeView {
        id: _swipeView

        currentIndex: 0
        anchors.fill: parent

        SensorFlowMeter {
            id: firstPage
        }
        SensorFillingFlowMeter {
            id: secondPage

        }
        SensorWheel {
            id: thirdPage
        }
        SensorPressure {
            id: fourthPage
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
//    Loader{
//        id: _loader
//        source: "qrc:/QML/SensorFlowMeter.qml"
//    }

//    Rectangle{
//        x: 512 - _row.width / 2
//        y: 490
//        Row{
//            id: _row
//            spacing:50
//            RadioButton{
//                id: _radioButtonFlowMeter
//                checked: true
//                onClicked:{
//                    if(checked){
//                        _loader.source = "qrc:/QML/SensorFlowMeter.qml"
//                    }
//                }

//                indicator: Rectangle {
//                    implicitWidth: 26
//                    implicitHeight: 26
//                    x: _radioButtonFlowMeter.leftPadding
//                    y: parent.height / 2 - height / 2
//                    radius: 13

//                    Rectangle {
//                        width: 14
//                        height: 14
//                        x: 6
//                        y: 6
//                        radius: 7
//                        color: "black"
//                        visible: _radioButtonFlowMeter.checked
//                    }
//                }
//            }
//            RadioButton{
//                id: _radioButtonFillingFlowMeter
//                onClicked:{
//                    if(checked){
//                        _loader.source = "qrc:/QML/SensorFillingFlowMeter.qml"
//                    }
//                }
//                indicator: Rectangle {
//                    implicitWidth: 26
//                    implicitHeight: 26
//                    x: _radioButtonFillingFlowMeter.leftPadding
//                    y: parent.height / 2 - height / 2
//                    radius: 13

//                    Rectangle {
//                        width: 14
//                        height: 14
//                        x: 6
//                        y: 6
//                        radius: 7
//                        color: "black"
//                        visible: _radioButtonFillingFlowMeter.checked
//                    }
//                }
//            }
//            RadioButton{
//                id: _radioButtonWheelSensor
//                onClicked:{
//                    if(checked){
//                        _loader.source = "qrc:/QML/SensorWheel.qml"
//                    }
//                }
//                indicator: Rectangle {
//                    implicitWidth: 26
//                    implicitHeight: 26
//                    x: _radioButtonWheelSensor.leftPadding
//                    y: parent.height / 2 - height / 2
//                    radius: 13

//                    Rectangle {
//                        width: 14
//                        height: 14
//                        x: 6
//                        y: 6
//                        radius: 7
//                        color: "black"
//                        visible: _radioButtonWheelSensor.checked
//                    }
//                }
//            }
//            RadioButton{
//                id: _radioButtonPressureSensor
//                onClicked:{
//                    if(checked){
//                        _loader.source = "qrc:/QML/SensorPressure.qml"
//                    }
//                }
//                indicator: Rectangle {
//                    implicitWidth: 26
//                    implicitHeight: 26
//                    x: _radioButtonPressureSensor.leftPadding
//                    y: parent.height / 2 - height / 2
//                    radius: 13

//                    Rectangle {
//                        width: 14
//                        height: 14
//                        x: 6
//                        y: 6
//                        radius: 7
//                        color: "black"
//                        visible: _radioButtonPressureSensor.checked
//                    }
//                }
//            }
//        }
//    }
//}
