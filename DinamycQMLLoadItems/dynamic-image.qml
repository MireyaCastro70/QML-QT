import QtQuick 2.15

Image {
    width: 400
    height: 225

    source: "assets/image1.png"

    Image {
        id: overlay

        anchors.fill: parent

        source: "assets/image2.png"

        opacity: 0;
        Behavior on opacity { NumberAnimation { duration: 300 } }
    }

    MouseArea {
        anchors.fill: parent
        onClicked: {
            if (overlay.opacity === 0)
                overlay.opacity = 1;
            else
                overlay.opacity = 0;
        }
    }
}
