import QtQuick 2.15

Rectangle{
    color: "blue"
    property alias text: label.text
    property alias fontColor: label.color
    Text{
        id: label
        anchors.centerIn: parent
        color: "white"
        font.pixelSize: 12
    }

}
