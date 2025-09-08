import QtQuick 2.15

Rectangle{
    color: "blue"
    property alias text: label.text
    Text{
        id: label
        anchors.centerIn: parent
        color: "white"
        font.bold: true
    }
}
