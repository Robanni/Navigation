import QtQuick
import QtLocation

Repeater{
    property int sectionCount: 10
    model: sectionCount
    MapPolyline
    {
        line.width: 5
        line.color: "red"
    }
}

