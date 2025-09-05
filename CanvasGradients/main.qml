import QtQuick 2.15
import QtQuick.Window 2.15

Window {
    width: root.width
    height: root.height
    visible: true
    title: qsTr("Hello World")
    Canvas{
        id: root
        width: 120; height: 120
        onPaint:{
            var ctx = getContext("2d")
            var gradient = ctx.createLinearGradient(100,0,100,200)
            gradient.addColorStop(0, "blue")
            gradient.addColorStop(0.5, "lightsteelblue")
            ctx.fillStyle = gradient
            ctx.fillRect(50,50,100,100)
        }
    }
}
