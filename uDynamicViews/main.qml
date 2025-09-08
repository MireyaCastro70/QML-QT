import QtQuick 2.15
import QtQuick.Window 2.15

Window {
    width: 220
    height: 300
    visible: true
    title: qsTr("Hello World")
    Gradient {
          GradientStop { position: 0.0; color: "#f6f6f6" }
          GradientStop { position: 1.0; color: "#d7d7d7" }
    }
    ListView{
        anchors.fill: parent
        anchors.margins: 20
        clip: true
        model:100
        delegate: numberDelegate
        spacing: 5
        focus: true
    }

    Component{
        id: numberDelegate
        Rectangle{
            width: ListView.view.width
            height: 40
            color: ListView.isCurrentItem ? "#157efb":"#53d769"
            border.color: Qt.lighter(color, 1.1)
            Text{
                anchors.centerIn: parent
                font.pixelSize: 10
                text: index
            }
        }
    }

}
