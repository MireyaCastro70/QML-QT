import QtQuick 2.15
import QtQuick.Window 2.15

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")
    //Imprime todas las clases del elementos QML
    Item {
      id: root
      Component.onCompleted: {
          var keys = Object.keys(root);
          for(var i=0; i<keys.length; i++){
              var key = keys[i];
              console.log(key + ':'+ root[key]);
          }
      }
    }
    //Analizar un objeto en una cadena JSON y viceversa
    Item{
        property var obj:{
            key: 'value'
        }
        Component.onCompleted: {
            var data = JSON.stringify(obj);
            console.log(data);
            var obj = JSON.parse(data);
            console.log(obj.key);
        }
    }
    //Fecha actual
    Item{
       Timer{
           id: timeUpdater
           interval:100
           running: true
           repeat: true
           onTriggered: {
               var d = new Date();
               console.log(d.getSeconds());
           }
       }
    }
    //Llamar a funcion por su nombre
    Item{
        id: root2
        function doIt(){
            console.log("doIt()")
        }
        Component.onCompleted: {
            roo2["doIt"]();
            var fn = root2["doIt"];
            fn.call()
        }
    }
}
