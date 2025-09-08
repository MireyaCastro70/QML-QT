import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Particles 2.0

Window {
    width: root.width
    height: root.height
    visible: true
    title: qsTr("Hello World")

    Rectangle{
        id: root
        width: 480; height: 160
        color: "#1f1f1f"
        ParticleSystem{
            id: particleSystem
        }
        Emitter{
            id: emitter
            anchors.centerIn: parent
            width: 20; height: 20
            system: particleSystem
            emitRate: 40
            lifeSpan: 2000
            lifeSpanVariation: 500
            size: 64
            endSize: 32
            //Tracer{ color: 'green'}
        }
        ImageParticle{
            source: 'assets/particle.png'
            system: particleSystem
        }
    }
}
