import QtQuick 2.15
import QtQuick.Controls 2.0

Item {
    id: root
    implicitWidth: 278
    implicitHeight: 36
    property alias testText: testName.text
    Rectangle {
        id: test
        anchors.fill: parent
        color: "transparent"
        Text {
            id: testName
            font.pixelSize: 16
            font.family: "Work Sans Medium"
            color: "#334155"
            anchors.verticalCenter: parent.verticalCenter
        }
        TextField{
            width: 128
            height: parent.height
            color: "#64748B"
            text: "0"
            anchors.right: parent.right
            background: Rectangle{
                anchors.fill: parent
                color: "#F1F5F9"
                radius: 4
                border.width: 1
            }
        }
    }
}
