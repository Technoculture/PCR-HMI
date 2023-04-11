import QtQuick 2.15

Item {
    id: root
    implicitWidth: 148
    implicitHeight: 36
    signal clicked()
    property alias text: label.text
    property color tabColor: "#E2E8F0"
    property string iconSource: ""
    property int labelFontSize: root.height * 0.45
    property color textColor: "white"
    Rectangle {
        anchors.fill: parent
        color: tabColor
        radius: 5
        Rectangle{
            width: parent.width
            height: parent.radius
            anchors.bottom: parent.bottom
            color: parent.color
        }

        Text {
            id: label
            font.pixelSize: labelFontSize
            color: textColor
            font.family: "Work Sans"
            leftPadding: 20
            anchors.verticalCenter: parent.verticalCenter
        }
        Image {
            id: icon
            source: "../Assets/Icons/"+iconSource
            scale: 0.66
            anchors.right: parent.right
            anchors.verticalCenter: parent.verticalCenter
        }
        MouseArea {
            id: ma
            anchors.fill: parent
            onClicked: root.clicked()
        }
    }
}
