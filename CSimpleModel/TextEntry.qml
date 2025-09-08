import QtQuick 2.15
import QtQuick.Layouts 1.2
import QtQuick.Controls 1.5

RowLayout{
    id: root
    signal append(string color)
    signal up()
    signal down()

    TextField{
        id: colorFiled
        Layout.fillWidth: true
        text: 'orange'
        onAccepted: {
            root.append(colorFiled.text)
        }
        Keys.onUpPressed: root.up()
        Keys.onDownPressed: root.down()
    }
    Button{
        text: 'Add'
        onClicked: {
            root.append(colorFiled.text)
        }
    }
}
