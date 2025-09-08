import QtQuick 2.15
import QtQuick.Window 2.15

Window {
    width: root.width
    height: root.height
    visible: true
    title: qsTr("Hello World")
    Image {
        id: root
        source: "file:///home/practicas/Projects/Images/fondo.jpg"
        property int padding: 40
        property int duration: 4000
        property bool running: false
        ClickableImageV2 {
            id: greenBox
            x:40; y: root.height
            source: "file:///home/practicas/Projects/Images/box_green.png"
            text: "animation on property"
            NumberAnimation on y {
                to: 40; duration: 4000
            }
        }
        ClickableImageV2 {
            id: blueBox
            x: (root.width-width)/2; y: root.height-height
            source: "file:///home/practicas/Projects/Images/blue-square-png-13.png"
            text: "behavior on property"
            Behavior on y {
                NumberAnimation { duration: 4000 }
            }

            onClicked: y = 40
            // random y on each click
            //onClicked: y = 40+Math.random()*(205-40)
        }
        ClickableImageV2 {
           id: redBox
           x: root.width-width-40; y: root.height-height
           source: "file:///home/practicas/Projects/Images/red-square-png-14.png"
           onClicked: anim.start()
        //onClicked: anim.restart()
           text: "standalone animation"
           NumberAnimation {
               id: anim
               target: redBox
               properties: "y"
               to: 40
               duration: 4000
           }
       }
    }
}
