import QtQuick 2.15
import QtQuick.Window 2.15

Window {
    width: root.width
    height: root.height
    visible: true
    title: qsTr("Hello World")
    DarkSquare {
        id: root
        width: 270
        height: 240
        GreenSquare {
            BlueSquare {
                width: 12
                anchors.fill: parent
                anchors.margins: 8
                Text {
                    id: square1
                    text: qsTr("(1)")
                    anchors.centerIn: parent
                }
            }
        }
        GreenSquare {
            x: 70;
            BlueSquare {
                width: 30
                height: 30
                y: 8
                anchors.left: parent.left
                anchors.leftMargin: 8
                Text {
                    id: square2
                    text: qsTr("(2)")
                    anchors.centerIn: parent
                }
            }
        }
        GreenSquare {
            x: 140;
            BlueSquare {
                width: 48
                anchors.left: parent.right
                Text {
                    id: square3
                    text: qsTr("(3)")
                    anchors.centerIn: parent
                }
            }
        }
        GreenSquare {
            y:70;
           BlueSquare {
               id: blue1
               width: 28; height: 14
               y: 8
               anchors.horizontalCenter: parent.horizontalCenter
           }
           BlueSquare {
               id: blue2
               width: 52; height: 14
               anchors.top: blue1.bottom
               anchors.topMargin: 4
               anchors.horizontalCenter: blue1.horizontalCenter
               Text {
                   id: square4
                   text: qsTr("(4)")
                   anchors.centerIn: parent
               }
           }
        }
        GreenSquare {
            y: 70; x:70
            BlueSquare {
                width: 38
                height: 38
                anchors.centerIn: parent
                Text {
                    id: square5
                    text: qsTr("(5)")
                    anchors.centerIn: parent
                }
            }
        }
        GreenSquare {
            y:70; x:140
                  BlueSquare {
                      width: 38
                      height: 38
                      anchors.horizontalCenter: parent.horizontalCenter
                      anchors.horizontalCenterOffset: -12
                      anchors.verticalCenter: parent.verticalCenter
                      Text {
                          id: square6
                          text: qsTr("(6)")
                          anchors.centerIn: parent
                      }
                  }
              }
    }
}
