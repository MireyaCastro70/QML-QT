import QtQuick 2.15
import QtQuick.Window 2.15
import QtMultimedia 5.12

Window {
    width: 1024
    height: 600
    visible: true
    title: qsTr("Hello World")
    Item {
        id: window

        width: 1024
        height: 600

        MouseArea {
            anchors.fill: parent
            onClicked: {
                if (window.state === "upsidedown") {
                    window.state = "";
                } else {
                    window.state = "upsidedown";
                }
            }
        }
        SoundEffect{
            id: beep
            source: "assets/beep.wav"
        }
        Rectangle {
            id: button
            anchors.centerIn: parent
            width: 200
            height: 100
            color: "red"
            MouseArea {
                anchors.fill: parent
                onClicked: beep.play()
            }
        }
        SoundEffect{
            id: swosh
            source: "assets/swosh.wav"
        }
        transitions: [
            Transition {
               ParallelAnimation{
                   ScriptAction{script: swosh.play();}
                   PropertyAnimation {properties: "rotation"; duration: 200;}
               }
            }
        ]
    }
}
