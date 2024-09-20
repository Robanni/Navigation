import QtQuick
import "qrc:/Elements/"

Item {
    id: root
    property real val: 500

    ListModel{
        id: listModel

        ListElement {f: 0 ; v: 0 ; t: 100 ; step: 1   }
        ListElement {f: 0 ; v: 0 ; t: 1   ; step: 0.1 }
        ListElement {f: 5 ; v: 5 ; t: 100 ; step: 1.5 }
        ListElement {f: 4 ; v: 4 ; t: 40  ; step: 0.1 }
        ListElement {f: 10; v: 10; t: 1000; step: 10  }
    }

    ListView{
        id: view
        anchors.fill: parent
        model: listModel
        //orientation: ListView.Horizontal

        delegate: Item{

            width: root.width
            height: root.height/5

            SliderForm{
                id: control
                anchors.centerIn: parent

                from: f
                to: t
                value: v
                stepSize: step

               onValueChanged: {
                   //value = control.value
                   print(value)
               }
            }

        }
    }

}
