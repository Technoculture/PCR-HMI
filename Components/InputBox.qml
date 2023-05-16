import QtQuick 2.15
import QtQuick.Controls 2.0

Item {
    id: root
    implicitWidth: 286
    implicitHeight: 36
    signal showKeyboard(var active)

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
//        Rectangle{
//            id: placeholder
//            color: "#F1F5F9"
//            width: parent.width-2
//            height: parent.height-2
//            radius: 4
//            x:1;y:1
//            Text {
//                id: phText
//                color: "#64748B"
//                font.pixelSize: 14
//                padding: {
//                    leftPadding: 16; rightPadding: 16
//                }
//                font.family: "Work Sans Medium"
//                anchors.verticalCenter: parent.verticalCenter
//            }
//        }
    }
}
