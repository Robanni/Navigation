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
            listModelButtonForm.setProperty(index,"name",settings.read(key))
        }
    }

    PageName{
        id: namePage
        name: "Самоходный опрыскиватель"
    }

    Image {
        id: sprayerAnfas
        x: 40
        y: namePage.y + namePage.height + 35
        source: "qrc:/Image/selfSprayerAnfas.png"
    }

    Image {
        id: sprayerUpview
        x: sprayerAnfas.x + sprayerAnfas.width + 94
        y: namePage.y + namePage.height + 35
        source: "qrc:/Image/selfSprayerUpview.png"
    }

    Image {
        id: infoSprayer
        source: "qrc:/Image/infoSelfSprayer.png"
        anchors{
            top: sprayerUpview.bottom
            topMargin: 70
            right: root.right
            rightMargin: 50
        }
    }

    ListModel{
        id: listModelButtonForm
        ListElement{name: ""; objectName: "SelfSprayerH"; leftText: "H"; mask: "00"}
        ListElement{name: ""; objectName: "SelfSprayerS"; leftText: "±S"; mask: "#00"}
        ListElement{name: ""; objectName: "SelfSprayerL"; leftText: "L"; mask: "00"}
    }

    ListView{
        id: listViewButtonForm

        x: sprayerAnfas.x + sprayerAnfas.width - 160
        y: sprayerAnfas.y + sprayerAnfas.height + 30
        height: 300
        model: listModelButtonForm
        spacing: 5

        delegate:     ButtonForm{
            id: button
            width: 150
            height: 45

            radius: 0

            nameButton: model.name
            objectName: model.objectName

            onClick: {
                _dialog.key = objectName
                root.index=index
                _dialog.mask = model.mask
                _dialog.open()
            }

            Component.onCompleted: {
                listModelButtonForm.setProperty(index,"name",settings.read(objectName))
            }

            Text{
                id: leftTxt
                height: parent.height
                text: model.leftText
                font.pixelSize: 24
                anchors{
                    right: parent.left
                    rightMargin: 20
                }
            }

            Text{
                id: rightTxt
                height: parent.height
                text: "м"
                font.pixelSize: 24
                anchors{
                    left: parent.right
                    leftMargin: 10
                }
            }
        }

    }
}
