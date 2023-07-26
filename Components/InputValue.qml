import QtQuick 2.15
import QtQuick.Controls 2.0

Item {
    id: root
    implicitWidth: 278
    implicitHeight: 36

    signal clicked()
    property alias propText: propertyTest.text
    property alias propValue: propertyValue.inputText
    property color myborder: "#64748B"
    property bool set: false
    Rectangle {
        id: test
        anchors.fill: parent
        color: "transparent"
        Text {
            id: propertyTest
            font.pixelSize: 16
            font.family: "Work Sans Medium"
            color: "#334155"
            anchors.verticalCenter: parent.verticalCenter
        }
        InputBox{
            id: propertyValue
            width: 128
            height: 36
            fixed: set
            anchors.right: parent.right
            myBorder: myborder
            onShowKeyboard: clicked()
        }
    }
}
