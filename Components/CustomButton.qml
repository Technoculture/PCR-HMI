import QtQuick 2.15

Item {
    id: root
    signal clicked()
    property alias text: label.text
    property int labelFontSize: root.height * 0.45
    property int butRadius: 10
    property color bgColor: "#059669"
    property color bgColorPressed: "#10B981"
    property color textColor: "white"
    Rectangle {
        id: background
        anchors.fill: parent
        radius: butRadius
        color: ma.pressed ? bgColorPressed : bgColor
        Text {
            id: label
            font.pixelSize: labelFontSize
            color: textColor
            font.family: "Work Sans Medium"
            visible: label.text !== ""
            anchors.centerIn: parent
        }
        MouseArea {
            id: ma
            anchors.fill: parent
            onClicked: root.clicked()
        }
    }
}
