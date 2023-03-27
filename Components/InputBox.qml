import QtQuick 2.15

Item {
    id: root
    implicitWidth: 286
    implicitHeight: 36

    property alias inputText: field.text
    property alias placeholderText: phText.text
    Rectangle{
        id: input
        anchors.fill: parent
        radius: 4
        border{
            width: 1
            color: "#64748B"
        }
        color: "#F1F5F9"
        Rectangle{
            id: placeholder
            color: "#F1F5F9"
            width: parent.width-2
            height: parent.height-2
            radius: 4
            Text {
                id: phText
                color: "#64748B"
                font.pixelSize: 14
                padding: {
                    leftPadding: 16; rightPadding: 16
                }
                font.family: "Work Sans Medium"
                anchors.verticalCenter: parent.verticalCenter
            }
        }
        TextInput{
            id: field
            color: "#64748B"
            font.pixelSize: 14
            padding: {
                leftPadding: 16; rightPadding: 16
            }
            font.family: "Work Sans Medium"
            anchors.verticalCenter: parent.verticalCenter
        }
        MouseArea{
            id: activeMouse
            anchors.fill: input
            onClicked: input.state="active"
        }

        states: [
            State {
                name: "active"
                PropertyChanges {
                    target: input
                    border.color: "#6EE7B7"
                }
                PropertyChanges {
                    target: placeholder
                    width: phText.paintedWidth+10
                    height: phText.paintedHeight+6
                    x: 18; y: -12
                }
                PropertyChanges {
                    target: phText
                    color: "#94A3B8"
                    font.pixelSize: 12
                    font.letterSpacing: 1
                    padding: {
                        leftPadding: 5; rightPadding: 5
                    }
                }
                PropertyChanges {
                    target: field
                    cursorVisible: true
                }
            }
        ]
    }
}
