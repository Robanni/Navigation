import QtQuick

Item {
    property real scaleFactor: 0.15

    property int numSections: 6     // Количество секций (общее для обеих сторон)
    property real sprayerLength: 10    // Длина штанги опрыскивателя

    property color sectionOnColor: "green"
    property color sectionOffColor: "red"

    // Массив для хранения состояния каждой секции
    property var leftSections: []
    property var rightSections: []

    Component.onCompleted: {
        // Инициализация массивов состояния секций
        leftSections = new Array(numSections / 2).fill(false)
        rightSections = new Array(numSections / 2).fill(false)
    }

    // Трактор в центре
    Rectangle {
        width: 20
        height: 15
        color: "blue"
        anchors.centerIn: parent
    }

    // Секции опрыскивателя левая штанга
    Repeater {
        id: repeaterLeftBar
        model: numSections / 2
        Rectangle {
            id: sectionLeftRect
            width: sprayerLength / scaleFactor / numSections
            height: 5
            color: sectionOffColor
            radius: 5
            y: parent.height / 2 - height / 2

            x: parent.width / 2 - (numSections / 2 - index) * width  // Левые секции идут влево от центра

            // Состояние включения/выключения секции
            property bool isOn: false

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    sectionLeftRect.isOn = !sectionLeftRect.isOn
                    sectionLeftRect.color = sectionLeftRect.isOn ? sectionOnColor : sectionOffColor
                    leftSections[numSections / 2 - index - 1] = sectionLeftRect.isOn
                }
            }
        }
    }

    // Секции опрыскивателя  правая штанга
    Repeater {
        id: repeaterRightBar
        model: numSections / 2
        Rectangle {
            id: sectionRightRect
            width: sprayerLength / scaleFactor / numSections
            height: 5
            color: sectionOffColor
            radius: 5
            y: parent.height / 2 - height / 2

            x: parent.width / 2 + (numSections / 2 - index - 1) * width  // Правые секции идут вправо от центра

            // Состояние включения/выключения секции
            property bool isOn: false

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    sectionRightRect.isOn = !sectionRightRect.isOn
                    sectionRightRect.color = sectionRightRect.isOn ? sectionOnColor : sectionOffColor
                    rightSections[numSections / 2 - index - 1] = sectionRightRect.isOn
                }
            }
        }
    }

    //  QPair<bool, int>; left?;index
    function toggleSection(left,i,status) {
        let isLeft = left;  // true для левой штанги, false для правой
        let index = i;  // индекс секции от внешней к внутренней

        //console.log(isLeft)
        //console.log(index)

        if (isLeft) {
            leftSections[index] = status;
            let leftSectionRect = repeaterLeftBar.itemAt(index);
            leftSectionRect.color = leftSections[index] ? sectionOnColor : sectionOffColor;
            leftSectionRect.isOn = leftSections[index];
        } else {
            rightSections[index] = status;
            let rightSectionRect = repeaterRightBar.itemAt(index);
            rightSectionRect.color = rightSections[index] ? sectionOnColor : sectionOffColor;
            rightSectionRect.isOn = rightSections[index];
        }

//        if (isLeft) {
//            leftSections[index] = !leftSections[index];
//            let leftSectionRect = repeaterLeftBar.itemAt(index);
//            leftSectionRect.color = leftSections[index] ? sectionOnColor : sectionOffColor;
//            leftSectionRect.isOn = leftSections[index];
//        } else {
//            rightSections[index] = !rightSections[index];
//            let rightSectionRect = repeaterRightBar.itemAt(index);
//            rightSectionRect.color = rightSections[index] ? sectionOnColor : sectionOffColor;
//            rightSectionRect.isOn = rightSections[index];
//        }
    }
}

