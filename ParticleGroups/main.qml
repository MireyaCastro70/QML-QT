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
        width: 480; height: 240
        color: '#1F1F1F'
        property bool tracer: false

        ParticleSystem{
            id: particleSystem
        }

        ImageParticle{
            id: smokePainter
            groups: ['smoke']
            source: 'assets/particle.png'
            alpha: 0.3
            entryEffect: ImageParticle.None
        }

        ImageParticle{
            id: rocketPainter
            system: particleSystem
            groups: ['rocket']
            source: "assets/rocket.png"
            entryEffect: ImageParticle.None
        }

        Emitter{
            id: rocketEmitter
            anchors.bottom: parent.bottom
            width: parent.width; height: 40
            system: particleSystem
            group: 'rocket'
            emitRate: 2
            maximumEmitted: 4
            lifeSpan: 4800
            lifeSpanVariation: 400
            size: 32
            velocity: AngleDirection{
                angle: 270
                magnitude: 150
                magnitudeVariation: 10
            }
            acceleration: AngleDirection{
                angle: 90
                magnitude: 50
            }
            Tracer{
                color: 'red'
                visible: root.tracer
            }
        }
        TrailEmitter{
            id: smoleEmitter
            system: particleSystem
            emitHeight: 1
            emitWidth: 4
            group: 'smoke'
            follow: 'rocket'
            emitRatePerParticle: 96
            velocity: AngleDirection{
                angle: 90
                magnitude: 100
                angleVariation: 5
            }
            lifeSpan: 200
            size: 16
            sizeVariation: 4
            endSize: 0
        }
        Turbulence{
            groups: ['rocket']
            anchors.bottom: parent.bottom
            width: parent.width; height: 160
            system: particleSystem
            strength: 25
            Tracer{
                color: 'green'
                visible: root.tracer
            }
        }
        ImageParticle {
            id: sparklePainter
            system: particleSystem
            groups: ['sparkle']
            color: 'red'
            colorVariation: 0.6
            source: "assets/star.png"
            alpha: 0.3
        }
        GroupGoal{
        id: rocketChanger
            anchors.top: parent.top
            width: parent.width; height: 80
            system: particleSystem
            groups: ['rocket']
            goalState: 'explosion'
            jump: true
            Tracer { color: 'blue'; visible: root.tracer }
        }
        ParticleGroup {
            name: 'explosion'
            system: particleSystem

            TrailEmitter {
                id: explosionEmitter
                anchors.fill: parent
                group: 'sparkle'
                follow: 'rocket'
                lifeSpan: 750
                emitRatePerParticle: 200
                size: 32
                velocity: AngleDirection { angle: -90; angleVariation: 180; magnitude: 50 }
            }
            TrailEmitter {
               id: explosion2Emitter
               anchors.fill: parent
               group: 'sparkle'
               follow: 'rocket'
               lifeSpan: 250
               emitRatePerParticle: 100
               size: 32
               velocity: AngleDirection { angle: 90; angleVariation: 15; magnitude: 400 }
           }
       }
    }
}
