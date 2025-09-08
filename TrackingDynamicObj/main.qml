import QtQuick 2.15
import QtQuick.Window 2.15
import "create-object.js" as CreateObject
import QtQuick.XmlListModel 2.0

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    Item {
        id: root

        ListModel {
            id: objectsModel
        }

        function addUfo() {
            CreateObject.create("ufo.qml", root, root.itemAdded);
        }

        function addRocket() {
            CreateObject.create("rocket.qml", root, root.itemAdded);
        }

        function itemAdded(obj, source) {
            objectsModel.append({"obj": obj, "source": source})
        }

        width: 1024
        height: 600

        function clearItems() {
            while (objectsModel.count > 0) {
                objectsModel.get(0).obj.destroy();
                objectsModel.remove(0)
            }
        }

        function serialize() {
            var res = "<?xml version=\"1.0\" encoding=\"utf-8\"?>\n<scene>\n";

            for (var ii = 0; ii < objectsModel.count; ++ii) {
                var i = objectsModel.get(ii);
                res += "  <item>\n    <source>" + i.source + "</source>\n    <x>" + i.obj.x + "</x>\n    <y>" + i.obj.y + "</y>\n  </item>\n"
            }

            res += "</scene>";
            return res;
        }

        XmlListModel {
            id: xmlModel
            query: "/scene/item"

            XmlRole {
                name: "source"
                query: "source/string()"
            }

            XmlRole {
                name: "x"
                query: "x/string()"
            }

            XmlRole {
                name: "y"
                query: "y/string()"
            }
        }

        function deserialize() {
            root.dsIndex = 0;
            if (xmlModel.count > 0)
                CreateObject.create(xmlModel.get(root.dsIndex).source, root, root.dsItemAdded);
        }

        function dsItemAdded(obj, source) {
            root.itemAdded(obj, source);
            obj.x = xmlModel.get(root.dsIndex).x;
            obj.y = xmlModel.get(root.dsIndex).y;

            root.dsIndex++;

            if (root.dsIndex < xmlModel.count)
                CreateObject.create(xmlModel.get(root.dsIndex).source, root, root.dsItemAdded);
        }

        property int dsIndex

        Column {
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.topMargin: 0
            spacing: 10
            width: 100

            Image {
                anchors.horizontalCenter: parent.horizontalCenter
                source: "ufo.png"

                MouseArea {
                    anchors.fill: parent
                    onClicked: root.addUfo();
                }
            }

            Image {
                anchors.horizontalCenter: parent.horizontalCenter
                source: "rocket.png"

                MouseArea {
                    anchors.fill: parent
                    onClicked: root.addRocket();
                }
            }

            Rectangle {
                anchors.horizontalCenter: parent.horizontalCenter
                width: 100
                height: 40
                color: "#53d769"

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        xmlModel.xml = root.serialize();
                        root.clearItems();
                    }
                }
            }

            Rectangle {
                anchors.horizontalCenter: parent.horizontalCenter
                width: 100
                height: 40
                color: "#fed958"

                MouseArea {
                    anchors.fill: parent
                    onClicked: root.deserialize();
                }
            }
        }
    }
}
