import QtQuick 2.15

Item {
    id: root
    signal clicked()
    property alias headText: head.text
    property alias bodyText: body.text
    property string iconSource: ""
    property color textColor: "white"
    Rectangle {
        anchors.fill: parent
        color: "transparent"
        Image {
            id: icon
            source: "../Assets/Icons/"+iconSource
            anchors.verticalCenter: parent.verticalCenter
            width: 32
            height: 32
        }
        Rectangle{
            width: parent.width
            height: 42
            anchors.left: icon.right
            anchors.verticalCenter: icon.verticalCenter
            Text {
                id: head
                font.pixelSize: 14
                color: textColor
                padding: 3
                font.family: "Work Sans Medium"
                leftPadding: 19
                font.letterSpacing: 0.3
            }
            Text {
                id: body
                font.pixelSize: 12
                color: "#475569"
                anchors.top: head.bottom
                padding: 3
                font.family: "Work Sans Regular"
                leftPadding: 19
                font.letterSpacing: 0.3
            }
        }
        MouseArea {
            id: ma
            anchors.fill: parent
            onClicked: root.clicked()
        }
    }
}
