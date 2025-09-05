import QtQuick 2.15
import QtQuick.Window 2.15

Window {
    width: root.width
    height: root.height
    visible: true
    title: qsTr("Hello World")
    DarkSquare {
        id: root
        width: 120
        height: 240

        Column {
            id: row
            anchors.centerIn: parent
            spacing: 8
            RedSquare { }
            GreenSquare { width: 96 }
            BlueSquare { }
        }
    }
}
