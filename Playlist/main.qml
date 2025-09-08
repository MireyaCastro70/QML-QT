import QtQuick 2.15
import QtQuick.Window 2.15
import QtMultimedia 5.12

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")
    MediaPlayer{
        id: player
        playlist: Playlist {
            PlaylistItem { source: "trailer_400p.ogg" }
            PlaylistItem { source: "trailer_400p.ogg" }
            PlaylistItem { source: "trailer_400p.ogg" }
        }
    }
    Component.onCompleted: {
        player.playlist.currentIndex = 0;
        player.play();
    }
}
