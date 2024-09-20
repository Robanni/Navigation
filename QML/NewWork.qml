import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import "qrc:/Elements/"

Item {
    id: root
    width: 1024
    height: 550

    Rectangle{
        width: 600
        height: 130
        anchors.centerIn: parent

        Column{

            Label{
                width: 600
                height: 20
                text: "Введите параметры новой обработки"
            }

            TextField{
                width: 600
                height: 30
                placeholderText: "Норма внесения"
            }

            TextField{
                width: 600
                height: 30
                placeholderText: "Тип форсунки"
            }

            TextField{
                width: 600
                height: 30
                placeholderText: "Капля"
            }
        }
    }
}
