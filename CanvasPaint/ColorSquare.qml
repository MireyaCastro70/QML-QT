import QtQuick 2.15

Rectangle {
    id: root
    width: 40
    height: 40
    color: "white"
    property bool active: false

    border.width: active ? 3 : 1
    border.color: active ? "black" : "gray"
    MouseArea {
        id: clickArea
        anchors.fill: parent
        onClicked: root.clicked()
        cursorShape: Qt.PointingHandCursor
    }
    signal clicked()
}
