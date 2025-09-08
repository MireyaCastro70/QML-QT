import QtQuick 2.15

Rectangle{
    color: "green"
    property alias text: label.text
    Text{
        id: label
        color: "black"
        font.bold: true
    }
}
