import QtQuick 2.15
import QtQuick.Window 2.15
import Qt.labs.settings 1.1

Window {
    id: window
    width: root.width
    height: root.height
    visible: true
    title: qsTr("Hello World")
    Rectangle{
        id: root
        width: 320
        height: 240
        color: "#000000"
        Settings{
            id: settings
            property alias color: root.color
        }
        MouseArea{
            anchors.fill: parent
            onClicked: root.color = Qt.hsla(Math.random(), 0.5, 0.5, 1.0)
        }
        function storeSettings(){
            settings.color = root.color
        }
    }
    Settings {
        category: 'window'
        property alias x: window.x
        property alias y: window.x
        property alias width: window.width
        property alias height: window.height
    }
}
