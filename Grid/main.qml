import QtQuick 2.15
import QtQuick.Window 2.15

Window {
    width: root.width
    height: root.height
    visible: true
    title: qsTr("Hello World")
    BrightSquare{
        id: root
        width: 160
        height: 160

        Grid{
            id: grid
            rows: 2
            columns: 2
            anchors.centerIn: parent
            spacing: 8
            RedSquare{}
            RedSquare{}
            RedSquare{}
        }
    }
}
