import QtQuick 2.15
import QtQuick.Window 2.15

Window {
    width: canvas.width
    height: canvas.height
    visible: true
    title: qsTr("Hello World")
    Canvas{
        width: 400; height: 200
        smooth: true
        id: canvas
        onPaint:{
            var ctx = getContext("2d")
            ctx.strokeStyle= "#333"
            ctx.fillRect(0,0, canvas.width ,canvas.height);
            ctx.shadowColor = "#2ed5fa";
            ctx.shadowOffSetX = 2;
            ctx.shadowOffSetY = 2;
            ctx.shadowBlur = 10;

            ctx.font = 'bold 80px Ubuntu';
            ctx.fillStyle = "#24d12e"
            ctx.fillText("Canvas!", 30, 180)

        }
    }
}
