import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Particles 2.0

Window {
    width: 640
    height: 480
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
            anchors.left: parent.left
            anchors.verticalCenter: parent.verticalCenter
            width: 1; height: 1
            system: particleSystem
            emitRate: 10
            lifeSpan: 6400
            lifeSpanVariation: 400
            size: 21
            velocity: TargetDirection{
              targetX: 100
              targetY: 50
              targetVariation: 100/6
              magnitude: 100
            }

            //Tracer{ color: 'green'}
        }
        ImageParticle{
            source: "assets/star.png"
            system: particleSystem
            color: '#FFD700'
            colorVariation: 0.2
            rotation: 0
            rotationVariation: 45
            rotationVelocity: 15
            rotationVelocityVariation: 15
            entryEffect: ImageParticle.Scale
        }
    }
}
