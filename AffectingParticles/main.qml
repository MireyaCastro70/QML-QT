import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Particles 2.0

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")
    Rectangle{
        color: 'black'
        id: root
        width: 480; height: 240
        ParticleSystem{
            id: particleSystem
        }
        ImageParticle{
            source: "assets/particle.png"
            system: particleSystem
            color: '#FFD700'
            colorVariation: 0.2
            rotationVariation: 45
            rotationVelocityVariation: 15
            entryEffect: ImageParticle.Scale
        }

        Emitter{
            id: emitter
            anchors.left: parent.left
            anchors.verticalCenter: parent.verticalCenter
            width: 1; height: 20
            system: particleSystem
            emitRate: 40
            lifeSpan: 6400
            lifeSpanVariation: 400
            size: 32
            velocity: AngleDirection{
                angle:0
                angleVariation: 15
                magnitude: 100
                magnitudeVariation: 50
            }
        }
        Wander{
            anchors.horizontalCenter: parent.horizontalCenter
            width: 240; height: 120
            system: particleSystem
            affectedParameter: Wander.Position
            pace: 200
            yVariance: 240
            Tracer{}
        }

    }
}
