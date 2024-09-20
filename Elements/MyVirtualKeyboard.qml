import QtQuick
import QtQuick.Controls

Rectangle{
    id: _rectangle

    property int pos: 0

    TextField{
        id: _textField
        width: _rectangle.width
        height: 50
        //inputMask: "999,99"
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
        ListElement{nameButton: "."}
        ListElement{nameButton: "0"}
        ListElement{nameButton: ","}

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
                pos++;
            print(_textField.cursorPosition())}

        }
    }

    Button{
        id: backspaceButton
        width: _rectangle.width / 4
        height: _gridView.height / 4

        anchors{
            top: _textField.bottom
            right: parent.right
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
        width: _rectangle.width / 4
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
        width: _rectangle.width / 4
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

        onClicked: {settings.write(_dialog.key, _textField.getText(0,pos));_textField.clear();pos=0;_dialog.close()}
    }
}


/*    Button{
        id: spaceButton
        width: _rectangle.width / 4
        height: _listView.height / 4

        anchors{
            top: backspaceButton.bottom
            right: parent.right
        }

        Text{
            id: txtSpace
            text: "Space"
            anchors.centerIn: parent
        }
        onClicked: {_textField.insert(pos," ");pos++}
    }*/
