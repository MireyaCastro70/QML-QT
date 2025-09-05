import QtQuick 2.15
import QtQuick.Window 2.15

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")
    Canvas{
        id: root
        width: 240; height: 120
        onPaint:{
            var ctx = getContext("2d")
            ctx.lineWidth = 4;
            ctx.strokeStyle = "blue";
            ctx.translate(root.width/2, root.height/2);
            ctx.beginPath();
            ctx.rect(-20,-20, 40, 40);
            ctx.stroke();
            ctx.rotate(Math.PI/4);
            ctx.strokeStyle = "green";
            ctx.beginPath();
            ctx.rect(-20, -20, 40, 40);
            ctx.stroke();
        }
    }
}
