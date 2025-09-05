import QtQuick 2.15
import QtQuick.Window 2.15

Window {
    width: 200
    height: 200
    visible: true
    title: qsTr("Hello World")
    Canvas{
        id: root
        width: 200; height: 200
        onPaint:{
            var ctx= getContext("2d")
            ctx.lineWidth = 4
            ctx.strokesStyle = "blue"
            ctx.fillStyle = "steelblue"
            ctx.beginPath()
            ctx.moveTo(50,50)
            ctx.lineTo(150,50)
            ctx.lineTo(150,150)
            ctx.lineTo(50,150)
            ctx.closePath()
            ctx.fill()
            ctx.stroke()
        }
    }
}
