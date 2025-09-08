import QtQuick 2.15
import QtQuick.Window 2.15

Window {
    width: root.width
    height: root.height
    visible: true
    title: qsTr("Row")
    BrightSquare {
        id: root
        width: 400; height: 120

        Row {
            id: row
            anchors.centerIn: parent
            spacing: 20
            BlueSquare { }
            GreenSquare { }
            RedSquare { }
        }
    }
}
