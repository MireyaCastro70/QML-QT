import QtQuick 2.15
import QtQuick.Window 2.15
import QtMultimedia 5.15

Window {
    width: 1024
    height: 600
    visible: true
    title: qsTr("Hello World")
    Item {
        width: 1024
        height: 600

        MediaPlayer {
            id: player
            source: "assets/video.ogg"
        }

        VideoOutput {
            anchors.fill: parent
            source: player
        }

        Component.onCompleted: {
            player.play();
        }
    }
}
