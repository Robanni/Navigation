import QtQuick
import QtQuick.Controls

Tumbler{
    id: control
    model: 10
    visibleItemCount: 1

    property alias name: control.objectName
    property string dot

    background: Item{
    }

    delegate: Text{
        id: txt

        text: name===dot ? "." : modelData
        font.pixelSize:     20
        //font: control.font
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        opacity: 1

        required property var modelData

    }

    contentItem: TumblerView {
        implicitWidth: 60
        implicitHeight: 200
        model: control.model
        delegate: control.delegate
        path: Path {
            startX: control.contentItem.width / 2
            startY: -control.contentItem.delegateHeight / 2
            PathLine {
                x: control.contentItem.width / 2
                y: (control.visibleItemCount + 1) * control.contentItem.delegateHeight - control.contentItem.delegateHeight / 2
            }
        }
        //y: (control.visibleItemCount + 1) * control.contentItem.delegateHeight - control.contentItem.delegateHeight / 2
        property real delegateHeight: control.availableHeight / control.visibleItemCount
    }

//    Rectangle {
//        anchors.horizontalCenter: control.horizontalCenter
//        y: control.height * 0.4
//        width: 40
//        height: 1
//        color: "#21be2b"
//    }
//     Rectangle {
//        anchors.horizontalCenter: control.horizontalCenter
//        y: control.height * 0.6
//        width: 40
//        height: 1
//        color: "#21be2b"
//    }
}


