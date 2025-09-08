import QtQuick 2.15

Image {
    source: "ufo.png"

    MouseArea {
        anchors.fill: parent

        drag.target: parent
        drag.axis: Drag.XandYAxis
    }
}
