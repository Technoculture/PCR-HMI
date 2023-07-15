import QtQuick 2.15
import QtQuick.Controls 2.1

Item {
    id: root
    implicitWidth: 286
    implicitHeight: 36

    property alias inputText: field.text
    property string placehText: ""
    property alias typeOfInput: field.echoMode
    property color myBorder: "#64748B"
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
            width: parent.width
            height: parent.height
            color: "#64748B"
            placeholderText: placehText
            anchors.right: parent.right
            font.family: "Work Sans Medium"
            background: Rectangle{
                id: activeBorder
                anchors.fill: parent
                color: "#F1F5F9"
                radius: 4
                border.width: 1; border.color: myBorder
            }
//            onFocusChanged: showKeyboard()
        }
    }
}
