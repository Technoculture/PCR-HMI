import QtQuick 2.15

Item {
    id: root
    implicitWidth: 220
    implicitHeight: 25
    property alias testText: testName.text
    Rectangle {
        id: test
        anchors.fill: parent
        color: "transparent"
        Text {
            id: testName
            font.pixelSize: 16
            font.family: "Work Sans Medium"
            leftPadding: 10
            color: "#334155"
            anchors.verticalCenter: parent.verticalCenter
        }
        Rectangle{
            id: toggleButton
            width: 38
            height: 18
            color: "#065F46"
            radius: 50
            anchors.right: parent.right
            anchors.verticalCenter: parent.verticalCenter
            Rectangle{
                id: toggle
                width: 24
                height: 24
                radius: 12
                color: "#34D399"
                x: -4
                anchors.verticalCenter: parent.verticalCenter
            }
            MouseArea{
                id: ma
                anchors.fill: parent
                onClicked: {
                    if(toggleButton.state === "On")
                        toggleButton.state = ""
                    else
                        toggleButton.state = "On"
                }
            }
            states: [
                State {
                    name: "On"
                    PropertyChanges {
                        target: toggle
                        x: 18
                    }
                }
            ]
        }
    }
}
