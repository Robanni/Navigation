import QtQuick
import QtQuick.Controls
import "qrc:/Elements/"

Item{
    id: root
    width: 1024
    height: 550

    KeyboardDialog{
        id: _dialog

        onReWrite: {
            _buttonFlow.nameButton = settings.read(_buttonFlow.objectName)
            _buttonMinPressure.nameButton = settings.read(_buttonMinPressure.objectName)
            _buttonMaxPressure.nameButton = settings.read(_buttonMaxPressure.objectName)
        }
    }

    PageName{
        id: _pageName
        name: "Пользовательская настройка форсунки"
    }

    Label{
        id: _flowLabel
        anchors{
            horizontalCenter: root.horizontalCenter
            top: root.top
            topMargin: 100
        }
        text: "Введите фактический расход на 1 форсунке при перепаде 3 бар"
        font.bold: true
        font.pixelSize: 20
    }

    ButtonForm{
        id: _buttonFlow
        width: 130
        height: 50
        x: (parent.width - width) / 2
        y: _flowLabel.y + _flowLabel.height + 35
        radius: 0
        objectName: "InjectorCustomFlow"
        nameButton: settings.read(objectName)
        onClick:{
            _dialog.open()
            _dialog.key = objectName

        }

        Text{
            id: _textFlow
            anchors.left: _buttonFlow.right
            anchors.leftMargin: 10
            anchors.top: _buttonFlow.top
            anchors.topMargin: (_buttonFlow.height  - height) / 2
            font.pixelSize: 30
            text: "л/мин"
        }
    }

    Label{
        id: _minPressureLabel
        x: (parent.width/2 - width) / 2
        y: _buttonFlow.y + _buttonFlow.height + 80
        text: "Минимальное давление"
        font.bold: true
        font.pixelSize: 20
    }

    Label{
        id: _maxPressureLabel
        x: _buttonMaxPressure.x - (_buttonMaxPressure.width/2)
        y: _buttonFlow.y + _buttonFlow.height + 80
        text: "Максимальное давление"
        font.bold: true
        font.pixelSize: 20
    }

    ButtonForm{
        id: _buttonMinPressure
        width: 130
        height: 50
        x: (parent.width/2 - width) / 2
        y: _minPressureLabel.y + _minPressureLabel.height + 35
        radius: 0
        objectName: "InjectorCustomMinPressure"
        nameButton: settings.read(objectName)
        onClick:{
            _dialog.open()
            _dialog.key = objectName

        }

        Text{
            id: _textMinPressure
            anchors.left: _buttonMinPressure.right
            anchors.leftMargin: 10
            anchors.top: _buttonMinPressure.top
            anchors.topMargin: (_buttonMinPressure.height  - height) / 2
            font.pixelSize: 30
            text: "бар"
        }
    }

    ButtonForm{
        id: _buttonMaxPressure
        width: 130
        height: 50
        x: parent.width - width  - (_buttonMinPressure.x + _textMaxPressure.width)
        y: _maxPressureLabel.y + _maxPressureLabel.height + 35
        radius: 0
        objectName: "InjectorCustomMaxPressure"
        nameButton: settings.read(objectName)
        onClick:{
            _dialog.open()
            _dialog.key = objectName

        }

        Text{
            id: _textMaxPressure
            anchors.left: _buttonMaxPressure.right
            anchors.leftMargin: 10
            anchors.top: _buttonMaxPressure.top
            anchors.topMargin: (_buttonMaxPressure.height  - height) / 2
            font.pixelSize: 30
            text: "бар"
        }
    }

    ButtonForm{
        id: _acceptButton
        width: 130
        height: 50
        anchors{
            horizontalCenter: root.horizontalCenter
            bottom: root.bottom
            bottomMargin: 50
        }
        radius: 0
        nameButton: "Принять"
        objectName: "Injector"
        onClick:{
            stackview.pop()
            stackview.pop()
            settings.write(objectName,"Польз. ")
            injectorsPage.settPage.upd(objectName)
        }
    }
    property var injectorsPage
    function set(previousPage){
        injectorsPage = previousPage
    }
}
