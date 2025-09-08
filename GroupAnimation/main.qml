import QtQuick 2.15
import QtQuick.Window 2.15

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    BrightSquare {
        id: root
        width: 600
        height: 400
        property int duration: 3000
        property Item ufo: ufo

        Image {
            anchors.fill: parent
            source: "file:///home/practicas/Projects/Images/fondo2.png"
        }


        ClickableImageV3 {
            id: ufo
            x: 20; y: root.height-height
            text: 'ufo'
            source: "file:///home/practicas/Projects/Images/ufo.png"
            onClicked: anim.restart()
        }

        ParallelAnimation {
            id: anim
            NumberAnimation {
                target: ufo
                properties: "y"
                to: 20
                duration: root.duration
            }
            NumberAnimation {
                target: ufo
                properties: "x"
                to: 160
                duration: root.duration
            }
        }
    }
}
