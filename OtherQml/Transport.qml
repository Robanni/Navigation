import QtQuick


Item{
    property double crossbarLenght: 20
    property int sectionsCount: 10

    Rectangle{

        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top

        width: 20
        height: 15

        color: "yellow"
    }
    Rectangle{
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom:  parent.bottom

        width: crossbarLenght/0.15
        height: 5

        color: "black"
        Canvas{
            anchors.fill: parent
            onPaint: {
                var ctx = getContext("2d");
                var delta = parent.width/sectionsCount

                ctx.clearRect(0, 0, width, height);

                ctx.lineWidth = 4
                ctx.strokeStyle = "red";

                for(var i = 1;i<sectionsCount;++i){
                    ctx.beginPath();

                    ctx.moveTo(i*delta,0)
                    ctx.lineTo(i*delta,parent.height)

                    ctx.stroke();
                }
            }
        }
    }
}
