import QtQuick 2.15
import QtQuick.Window 2.15

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    Image {
        id: root
        source: "file:///home/practicas/Projects/Images/background.png"

        Image {
            id: pole
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom
            source: "file:///home/practicas/Projects/Images/pole.png"
        }
        Image {
            id: wheel
            anchors.centerIn: parent
            Behavior on rotation {
                NumberAnimation {
                duration: 250
                }
            }
            source: "file:///home/practicas/Projects/Images/pinwheel.png"
        }
        MouseArea {
            anchors.fill: parent
            onClicked: wheel.rotation += 90
        }
    }
}
