import QtQuick 2.15
import QtQuick.Window 2.15

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    Loader{
        id: dialLoader
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: analogButtom.top
        onLoaded: {
            binder.target = dialLoader.item;
        }
    }
    Binding{
        id: binder
        property: "speed"
        value: speed
    }
}
