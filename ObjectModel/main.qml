import QtQuick 2.15
import QtQuick.Window 2.15

Window {
    width: 320
    height: 320
    visible: true
    title: qsTr("Hello World")
    Gradient{
        GradientStop{position: 0.0; color: "#f6f6f6"}
        GradientStop{position: 0.0; color: "#d7d7d7"}
    }
    ObjectModel{
        id: itemModel
        Rectangle{ height: 60; width: 60; color: "#157efb"}
        Rectangle { height: 20; width: 300; color: "#53d769"
            Text { anchors.centerIn: parent; color: "black"; text: "Hello QML" }
        }
        Rectangle{ height: 40; width: 40; radius: 10; color: "#fc1a1c"}
    }
    ListView{
        anchors.fill: parent
        anchors.margins: 10
        spacing: 5
        model: itemModel
    }
}
