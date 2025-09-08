import QtQuick 2.15
import QtQuick.Window 2.15

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")
    Rectangle{
        width: 480; height: 240
        color: "#1e1e1e"
        Image{
            id: sourceImage
            width: 160; height: width
            source: "assets/lighthouse.jpg"
            visible: false
        }
        Rectangle{
            width: 160; height: width
            anchors.centerIn: parent
            color: "#333333"
        }
        ShaderEffect{
            id: genieEffect
            width: 160; height: width
            anchors.centerIn: parent
            property variant source: sourceImage
            property real minimize: 0.0
            property bool minimized: false

            SequentialAnimation on minimize{
                id: animMinimize
                running: genieEffect.minimize

                PauseAnimation {
                    duration: 300
                }
                NumberAnimation{ to: 1; duration: 700; easing.type: Easing.InOutSine}

                PauseAnimation {
                    duration: 100
                }
            }

            SequentialAnimation{
                id: animNormalize
                running: !genieEffect.minimize
                NumberAnimation{to: 1; duration: 700; easing.type: Easing.InOutSine}

                PauseAnimation {
                    duration: 1300
                }
            }
            vertexShader:" uniform highp mat4 qt_Matrix;
            uniform highp float minimize;
            uniform highp float height;
            uniform highp float width;
            attribute highp vec4 qt_Vertex;
            attribute highp vec2 qt_MultiTexCoord0;
            varying highp vec2 qt_TexCoord0;
            void main() {
                qt_TexCoord0 = qt_MultiTexCoord0;
                highp vec4 pos = qt_Vertex;
                pos.y = mix(qt_Vertex.y, height, minimize);
                highp float t = pos.y / height;
                pos.x = mix(qt_Vertex.x, width, t * minimize);
                gl_Position = qt_Matrix * pos;
            }"
            MouseArea{
                anchors.fill: parent
                onClicked: parent.minimized = !parent.minimized
            }
        }
    }
}
