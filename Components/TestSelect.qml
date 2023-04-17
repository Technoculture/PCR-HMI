import QtQuick 2.15

Item {
    id: root
    signal clicked()
    property alias testText: testName.text
    property bool bottomLine: true
    Rectangle {
        id: test
        anchors.fill: parent
        Text {
            id: testName
            font.pixelSize: 16
            font.family: "Work Sans Medium"
            leftPadding: 7
            anchors.verticalCenter: parent.verticalCenter
        }
        Button{
            id: saveTest
            width: 58
            height: 34
            anchors.right: parent.right
            text: "Save"
            bgColor: "#059669"
            labelFontSize: 12
            butRadius: 4
            anchors.verticalCenter: parent.verticalCenter
        }
    }
    Rectangle{
        width: parent.width
        height: 1
        color: "#E2E8F0"
        visible: bottomLine
        anchors.topMargin: 4
        anchors.top: test.bottom
    }
}
