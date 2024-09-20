import QtQuick
import QtQuick.Controls
import "qrc:/Elements/"

Item {
    id: root
    property int index


    KeyboardDialog{
        id: _dialog

        onReWrite: {

            listModelLabel.setProperty(index,"text",settings.read(key))

        }
    }

     SwipeView {
          id: view

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

          count: view.count
          currentIndex: view.currentIndex

          delegate: Rectangle {
                   implicitWidth: 26
                   implicitHeight: 26

                   radius: width / 2
                   color: "#21be2b"

                   opacity: index === indicator.currentIndex ? 0.95 : pressed ? 0.7 : 0.45

                   required property int index

                   Behavior on opacity {
                       OpacityAnimator {
                           duration: 100
                       }
                   }
               }

          anchors.bottom: view.bottom
          anchors.horizontalCenter: parent.horizontalCenter
      }

  }
