import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15

ApplicationWindow {
    visible: true
    width: 800
    height: 600
    title: "Sample Application"

    // Start screen
    Rectangle {
        id: startScreen
        anchors.fill: parent
        color: "lightblue"

        Text {
            id: titleText
            anchors.centerIn: parent
            text: "LTX Project"
            font.bold: true
            font.pointSize: 32
            color: "navy"
        }

        Rectangle {
            id: startButton
            width: 200
            height: 50
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenterOffset: 100
            anchors.verticalCenter: parent.verticalCenter
            radius: 10
            color: "white"
            border.color: "black"
            border.width: 2

            Text {
                anchors.centerIn: parent
                text: "Start"
                font.pointSize: 16
                font.bold: true
                color: "black"
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    startScreen.visible = false;
                    flightSimulator.visible = true;
                    aircraft.focus = true;
                }
            }
        }
    }

    // Flight Simulator scene
    Rectangle {
        id: flightSimulator
        anchors.fill: parent
        visible: false
        color: "skyblue"

        // Ground
        Rectangle {
            id: ground
            anchors.bottom: parent.bottom
            height: parent.height * 0.3
            width: parent.width
            color: "green"
        }

        // Aircraft Image (flight image in PNG)
        Image {
            id: aircraft
            source: "qrc:/sampleltxproject/Images/Flight.png" 
            width: 180
            height: 230
            anchors.left: parent
            y: parent.height / 2 - height / 2 
 
           

            focus: true 

            // Key press event handling
            Keys.onPressed: {
                switch (event.key) {
                    case Qt.Key_W:
                        y = Math.max(0, y - 10);
                        break;
                    case Qt.Key_S:
                        y = Math.min(parent.height - height,y + 10);
                        break;
                    case Qt.Key_A:
                        x = Math.max(0, x - 10);
                        break;
                    case Qt.Key_D:
                        x = Math.min(parent.width - width, x + 10);
                        break;
                    default:
                        break;
                }
                   
        }
    }

    }

}