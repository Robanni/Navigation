import QtQuick
import QtQuick.Controls
import "qrc:/Elements/"

Item{
    id: root
    width: 1024
    height: 600

    property var arr: [4]
    property string value

    property var test: [1,2,3,4,5]

    Rectangle{
        id: rectan
        width: 60*listModel.count
        height: 200
        anchors.centerIn: root
        //color: Qt.rgba(0,0,0,0)

        ListModel{
            id: listModel

            ListElement{nameObject: "tumbler4"; enableOn: true }
            ListElement{nameObject: "tumbler3"; enableOn: true }
            ListElement{nameObject: "tumbler2"; enableOn: true }
            ListElement{nameObject: "tumbler1"; enableOn: false}
            ListElement{nameObject: "tumbler0"; enableOn: true }
        }

        ListView{
            id: view
            anchors.fill: parent
            model: listModel
            orientation: ListView.Horizontal

            delegate: TumblerForm{
                id: control

                name: nameObject
                enabled: enableOn
                dot: "tumbler1"
                // opacityText: 1.0 - Math.abs(Tumbler.displacement) / (control.visibleItemCount / 2)
                onMovingChanged:{
                    //print("moving")
                }

                onCurrentIndexChanged: {
                    switch (name){

                    case "tumbler4": {arr[4]=currentIndex.toString();}
                    break;

                    case "tumbler3": {arr[3]=currentIndex.toString();}
                    break;

                    case "tumbler2": {arr[2]=currentIndex.toString();}
                    break;

                    case "tumbler1": arr[1]="."
                        break;

                    case "tumbler0": {arr[0]=currentIndex.toString();}
                    break;
                    }
                    value=arr[4]+arr[3]+arr[2]+arr[1]+arr[0]
                }
            }
        }
    }
    Button{
        id: okButton

        width: 40
        height: 40

        x: 712
        y: 280

        text: "OK"


        onClicked: print(value)

    }
}
