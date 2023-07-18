import QtQuick 2.15
import QtQuick.Controls 2.0
import "../Components"

Item {
    id: root
    implicitWidth: 210
    implicitHeight: 20

    signal selectClicked()
    signal editClicked()
    property alias testText: testName.text
    Rectangle {
        id: test
        anchors.fill: parent
        color: "transparent"
        Text {
            id: testName
            font.pixelSize: 14
            font.family: "Work Sans Medium"
            color: "#64748B"
            topPadding: 2
            bottomPadding: 2
        }
        Rectangle{
            id: edit
            width: 95
            height: 20
            anchors.right: parent.right
            CustomButton{
                id: saveTest
                width: 50
                height: 20
                text: "Select"
                butRadius: 4
                labelFontSize: 12
                onClicked: root.selectClicked()
            }
            CustomButton{
                id: editButton
                width: 45
                height: 20
                anchors.right: parent.right
                text: "Edit"
                labelFontSize: 14
                bgColor: "transparent"
                bgColorPressed: "transparent"
                textColor: "#059669"
                onClicked: root.editClicked()
            }
//            Text {
//                id: editButton
//                text: "Edit"
//                font.pixelSize: 14
//                font.family: "Work Sans"
//                anchors.right: parent.right
//                color: "#059669"
//            }
        }
    }
}
