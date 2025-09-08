import QtQuick 2.15
import QtQuick.Window 2.15

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")
    TableView {
        id: view
        anchors.fill: parent
        anchors.margins: 20
        rowSpacing: 5
        columnSpacing: 5
        clip: true
        model: tableModel
        delegate: cellDelegate
    }
    Component {
        id: cellDelegate
        GreenBox{
            implicitHeight: 40
            implicitWidth: 40
            Text {
                anchors.centerIn: parent
                text: display
            }
        }
    }
}
