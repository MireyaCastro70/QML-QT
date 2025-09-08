import QtQuick 2.15
import QtQuick.Controls 2.15

Item {
    id: root
    property alias source: img.source
    property string text: ""
    signal clicked()

    width: img.width
    height: img.height

    Image {
        id: img
        width: 100
        height: 100
    }

    Text {
        id: label
        text: root.text
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.bottom
        font.bold: true
        color: "white"
    }

    MouseArea {
        anchors.fill: parent
        onClicked: root.clicked()
    }
}
