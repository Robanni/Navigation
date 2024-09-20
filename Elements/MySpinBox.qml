import QtQuick
import QtQuick.Controls

SpinBox {
    id: control

    from: 0
    to: 9

    onActiveFocusChanged: forceActiveFocus()

    onValueModified:{
        console.log(str2=textFromValue(control.value))
    }

    contentItem: TextInput {
        z: -1
        text: control.textFromValue(control.value, control.locale)

        font.pixelSize: 20
        color: "#21be2b"
        selectionColor: "#21be2b"
        selectedTextColor: "#ffffff"
        horizontalAlignment: Qt.AlignHCenter
        verticalAlignment: Qt.AlignVCenter

        readOnly: !control.editable
        validator: control.validator
        inputMethodHints: Qt.ImhFormattedNumbersOnly
    }

    up.indicator: Rectangle {
        x: control.mirrored ? 0 : parent.width - width
        y: -height + parent.height/3
        width: parent.width
        implicitWidth: parent.width
        implicitHeight: parent.height/3
        color: control.up.pressed ? "#e4e4e4" : control.focus ? "#f6f6f6" : "#ffffff"
        border.color: enabled ? "#21be2b" : "#bdbebf"

        Text {
            text: "+"
            font.pixelSize: control.font.pixelSize * 2
            color: "#21be2b"
            anchors.fill: parent
            fontSizeMode: Text.Fit
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }
    }

    down.indicator: Rectangle {
        x: control.mirrored ? parent.width - width : 0
        y: height*2
        width: parent.width
        implicitWidth: parent.width
        implicitHeight: parent.height/3
        color: control.down.pressed ? "#e4e4e4" : control.focus ? "#f6f6f6" : "#ffffff"
        border.color: enabled ? "#21be2b" : "#bdbebf"

        Text {
            text: "-"
            font.pixelSize: control.font.pixelSize * 2
            color: "#21be2b"
            anchors.fill: parent
            fontSizeMode: Text.Fit
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }
    }

    background: Rectangle {
        implicitWidth: 140
        color: control.focus ? "#f6f6f6" : "#ffffff"
        border.color: "#bdbebf"
    }
}
