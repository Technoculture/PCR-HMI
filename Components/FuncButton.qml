import QtQuick 2.15

Item {
    id: root
    implicitWidth: icon.width+label.paintedWidth
    implicitHeight: icon.height
    signal clicked()
    property alias text: label.text
    property string iconSource: ""
    property int labelFontSize: root.height * 0.45
    property color textColor: "white"
    Rectangle {
        anchors.fill: parent
        color: "transparent"
        Image {
            id: icon
            source: "../Assets/Icons/"+iconSource
            scale: 0.66
            anchors.verticalCenter: parent.verticalCenter
        }
        Text {
            id: label
            font.pixelSize: labelFontSize
            color: textColor
            font.family: "Work Sans"
            anchors.left: icon.right
            anchors.verticalCenter: icon.verticalCenter
        }
        MouseArea {
            id: ma
            anchors.fill: parent
            onClicked: root.clicked()
        }
    }
}
