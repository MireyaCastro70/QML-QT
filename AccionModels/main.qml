import QtQuick 2.15
import QtQuick.Window 2.15

Window {
    width: 120
    height: 300
    visible: true
    title: qsTr("Hello World")
    Gradient{
        GradientStop{position: 0.0; color: "#f6f6f6"}
        GradientStop{position: 1.0; color: "#d7d7d7"}
    }
    ListModel{
        id: actionModel
        ListElement{
            name: "Compahagen"
            hello: function(value){console.log(value+ ": You Clicked Compahagen!");}
        }
        ListElement {
            name: "Helsinki"
            hello: function(value) { console.log(value + ": Helsinki here!"); }
        }
        ListElement {
            name: "Oslo"
            hello: function(value) { console.log(value + ": Hei Hei fra Oslo!"); }
        }
        ListElement {
            name: "Stockholm"
            hello: function(value) { console.log(value + ": Stockholm calling!"); }
        }
    }
    ListView{
        anchors.fill: parent
        anchors.margins: 20
        clip: true
        model: actionModel
        delegate: actionDelegate
        spacing: 5
        focus: true
    }

    Component{
        id: actionDelegate
        Rectangle{
            width: ListView.view.width
            height: 40
            color: "#157efb"
            Text{
                anchors.centerIn: parent
                font.pixelSize: 10
                text: name
            }
            MouseArea{
                anchors.fill: parent
                onClicked: hello(index)
            }
        }
    }
}
