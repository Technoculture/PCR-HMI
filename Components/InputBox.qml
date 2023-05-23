import QtQuick 2.15
import QtQuick.Controls 2.0

Item {
    id: root
    implicitWidth: 286
    implicitHeight: 36
    signal showKeyboard()

    property alias inputText: field.text
    property string placehText: ""
    property alias typeOfInput: field.echoMode
    Rectangle{
        id: input
        anchors.fill: parent
        radius: 4
        border{
            width: 1
            color: "#64748B"
        }
        TextField{
            id: field
            anchors.fill: parent
            color: "#64748B"
            placeholderText: placehText
            anchors.right: parent.right
            font.family: "Work Sans Medium"
            background: Rectangle{
                anchors.fill: parent
                color: "#F1F5F9"
                radius: 4
                border.width: 1; border.color: "#64748B"
            }
            onFocusChanged: showKeyboard()
        }
    }
}
