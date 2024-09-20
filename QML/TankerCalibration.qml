import QtQuick
import QtQuick.Controls
import "qrc:/Elements/" as Elements

Item {
    id: root
    width: 1024
    height: 550
    Elements.MyLabel{
        id: _title
        textLabel: "Калибровка"
        fontPixelSize: 30
        fontBold: true
        anchors{
            horizontalCenter: root.horizontalCenter
            top: root.top
            topMargin: 30
        }
    }

    BusyIndicator{
        id: _busyIndicator
        //running:
        anchors{
            verticalCenter: _labelBusy.verticalCenter
            right: _labelBusy.left
            rightMargin: 5
        }
    }
    Elements.MyLabel{
        id: _labelBusy
        textLabel: "Подождите идёт калибровка"
        fontPixelSize: 24
        anchors{
            horizontalCenter: root.horizontalCenter
            top: _title.top
            topMargin: 40
        }
    }

    Image{
        id: _imageTanker
        source: "qrc:/Image/tankerCalibration.png"
        anchors{
            top: _title.bottom
            left: root.left
            topMargin: 120
            leftMargin: 50
        }
    }

    Image {
        id: _imageArrowLeft
        source: "qrc:/Image/arrowLeft.png"
        anchors{
            left: _imageTanker.right
            verticalCenter: _imageTanker.verticalCenter
            leftMargin: 30
        }
    }

    Elements.MyLabel{
        id: _labelCapacity
        textLabel: "Объём"
        fontBold: true
        font.pixelSize: 24
        anchors{
            top: _imageArrowLeft.top
            left: _imageArrowLeft.right
            topMargin: -10
        }
    }

    Elements.MyLabel{
        id: _labelCapacityMax
        textLabel: "52"
        fontBold: true
        font.pixelSize: 24
        anchors{
            top: _imageArrowLeft.top
            left: _imageArrowLeft.right
            topMargin: 40
            leftMargin: 5
        }
        unit: "л"
    }

    Elements.MyLabel{
        id: _labelCapacityMin
        textLabel: "52"
        fontBold: true
        font.pixelSize: 24
        anchors{
            bottom: _imageArrowLeft.bottom
            left: _imageArrowLeft.right
            bottomMargin: 30
            leftMargin: 5
        }
        unit: "л"
    }

    Image {
        id: _imageArrowRight
        source: "qrc:/Image/arrowRight.png"
        anchors{
            left: _imageArrowLeft.right
            verticalCenter: _imageTanker.verticalCenter
            leftMargin: 200
        }
    }

    Elements.MyLabel{
        id: _labelAmperage
        textLabel: "Ток"
        fontBold: true
        font.pixelSize: 24
        anchors{
            top: _imageArrowRight.top
            left: _imageArrowRight.right
            topMargin: -10
        }
    }

    Elements.MyLabel{
        id: _labelAmperageMax
        textLabel: "52"
        fontBold: true
        font.pixelSize: 24
        anchors{
            top: _imageArrowRight.top
            left: _imageArrowRight.right
            topMargin: 40
            leftMargin: 5
        }
        unit: "mA"

    }

    Elements.MyLabel{
        id: _labelAmperageMin
        textLabel: "52"
        fontBold: true
        font.pixelSize: 24
        anchors{
            bottom: _imageArrowRight.bottom
            left: _imageArrowRight.right
            bottomMargin: 30
            leftMargin: 5
        }

        unit: "mA"

    }
}
