import QtQuick
import QtQuick.Controls

Dialog{

    id: _dialog
    width: 400
    height: 350
    anchors.centerIn: parent


    property string key
    property alias mask: _textField.inputMask
    property int pos: 0
    property string textFieldValue: _textField.getText(0,pos)
    signal reWrite()

    onAccepted: {
        settings.write(key, _textField.getText(0,pos));
        _textField.clear();
        pos=0;
    }


    TextField{
        id: _textField
        width: parent.width
        height: 50
        readOnly: true
        inputMask: ""
    }

    ListModel{
        id: _listModel
        ListElement{nameButton: "7"}
        ListElement{nameButton: "8"}
        ListElement{nameButton: "9"}
        ListElement{nameButton: "4"}
        ListElement{nameButton: "5"}
        ListElement{nameButton: "6"}
        ListElement{nameButton: "1"}
        ListElement{nameButton: "2"}
        ListElement{nameButton: "3"}
        ListElement{nameButton: "-"}
        ListElement{nameButton: "0"}
        ListElement{nameButton: "."}

    }

    GridView{
        id: _gridView
        model: _listModel
        cellWidth: width / 3
        cellHeight: height / 4
        anchors{
            top: _textField.bottom
            bottom: parent.bottom
            right: backspaceButton.left
            left: parent.left
        }

        delegate:Button{
            width: _gridView.width / 3
            height: _gridView.height / 4

            Text{
                id: txt
                text: nameButton
                anchors.centerIn: parent
            }
            onClicked: {_textField.insert(pos,txt.text);
                pos++
            print(pos)}
        }
    }

    Button{
        id: backspaceButton
        width: parent.width / 4
        height: _gridView.height / 4

        anchors{
            top: _textField.bottom
            right: parent.right
        }

        Timer{
            id: _timer
        }

        Text{
            id: txtBackspace
            text: "Удалить"
            anchors.centerIn: parent
        }
        onClicked: {_textField.remove(pos-1,pos);pos--}
    }

    Button {
        id: spaceButton
        width: parent.width / 4
        height: _gridView.height / 4
        flat: true

        contentItem: Text {
            text: "Пробел"
            font: spaceButton.font
            color: spaceButton.down ? "gray" : "white"
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            elide: Text.ElideRight
        }

        background: Rectangle {
            color: "black"
            border.color: "white"
            border.width: 1
        }

        anchors{
            top: backspaceButton.bottom
            right: parent.right
        }
    }

    Button{
        id: enterButton
        width: parent.width / 4
        height: _gridView.height / 2

        anchors{
            top: spaceButton.bottom
            right: parent.right
        }

        Text{
            id: txtEnter
            text: "Принять"
            anchors.centerIn: parent
        }

        onClicked: {_dialog.accept();_dialog.reWrite();}
    }
}


/*Dialog{
    id: _dialog
    width: 400
    height: 350
    anchors.centerIn: parent
    property string key

    MyVirtualKeyboard{
        width: parent.width
        height: parent.height
        anchors.centerIn: parent

    }
}*/
