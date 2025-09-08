import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 1.5
import QtQuick.Layouts 1.2

import org.example 1.0

Window {
    visible: true
    width: 480
    height: 480


    Background {
        id: background
    }

    DynamicEntryModel {
        id: dynamic
        onCountChanged: {
            print('new count: ' + count);
            print('last entry: ' + get(count-1));
        }
    }

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 8
        ScrollView {
            Layout.fillHeight: true
            Layout.fillWidth: true
            ListView {
                id: view
                model: dynamic
                delegate: ListDelegate {
                    width: ListView.view.width
                    text: 'hsv(' +
                          Number(model.hue).toFixed(2) + ',' +
                          Number(model.saturation).toFixed() + ',' +
                          Number(model.brightness).toFixed() + ')'
                    // sets the font color of our custom delegates
                    color: model.name

                    onClicked: {
                        view.currentIndex = index
                        view.focus = true
                    }
                    onRemove: {
                        dynamic.remove(index)
                    }
                }
                highlight: ListHighlight { }
                add: Transition {
                    NumberAnimation {
                        properties: "x"; from: -view.width;
                        duration: 250; easing.type: Easing.InCirc
                    }
                    NumberAnimation { properties: "y"; from: view.height;
                        duration: 250; easing.type: Easing.InCirc
                    }
                }
                remove: Transition {
                    NumberAnimation {
                        properties: "x"; to: view.width;
                        duration: 250; easing.type: Easing.InBounce
                    }
                }
                displaced: Transition {
                    SequentialAnimation {
                        PauseAnimation { duration: 250 }
                        NumberAnimation { properties: "y"; duration: 75
                        }
                    }
                }
            }
        }
        TextEntry {
            id: textEntry
            onAppend: {
                dynamic.append(color)
            }

            onUp: {
                view.decrementCurrentIndex()
            }
            onDown: {
                view.incrementCurrentIndex()
            }

        }
    }
}
