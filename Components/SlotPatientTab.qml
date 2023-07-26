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
//        Grid{
//            columns: 2
//            columnSpacing: 60
//            anchors.fill: parent
            Text {
                id: label
                font.pixelSize: labelFontSize
                color: textColor
                font.family: "Work Sans"
                leftPadding: 15
                anchors.verticalCenter: parent.verticalCenter
            }
            Image {
                id: icon
                source: "../Assets/Icons/"+iconSource
                scale: 0.8
                anchors.right: parent.right
                anchors.verticalCenter: parent.verticalCenter
            }
//        }
        MouseArea {
            id: ma
            anchors.fill: parent
            onClicked: root.clicked()
        }
    }
}
