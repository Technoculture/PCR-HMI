import QtQuick 2.15

Item {
    id: root
    signal clicked()
    property color bodyColor: "transparent"
    property alias headText: head.text
    property alias bodyText: body.text
    property string iconSource: ""
    Rectangle {
        anchors.fill: parent
        color: bodyColor
        Image {
            id: icon
            source: "../Assets/Icons/"+iconSource
            anchors.verticalCenter: parent.verticalCenter
            width: 32
            height: 32
        }
        Rectangle{
            width: parent.width
            height: 46
            anchors.left: icon.right
            anchors.verticalCenter: icon.verticalCenter
            color: "transparent"
            Text {
                id: head
                font.pixelSize: 14
                color: "#334155"
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
