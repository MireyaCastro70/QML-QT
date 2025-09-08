import QtQuick 2.15
import QtQuick.Window 2.15

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")
    Rectangle {
        width: 200
        height: 80
        color: "linen"

        TLineEditV2 {
            id: input1
            x: 8; y: 8
            width: 96; height: 20
            focus: true
            text: "Text Input 1"
            KeyNavigation.tab: input1
        }
        TLineEditV2 {
            id: input2
            x: 8; y: 36
            width: 96; height: 20
            text: "Text Input 2"
            KeyNavigation.tab: input2
        }
    }
    Rectangle {
        width: 136
        height: 120
        color: "linen"
        y: 90

        TTextEdit {
            id: input
            x: 8; y: 8
            width: 120; height: 104
            focus: true
            text: "Text Edit"
        }
    }
}
