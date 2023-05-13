import QtQuick 2.15
import QtQuick.Controls 2.0
import "../Components"

Item {
    id: root
    implicitWidth: 210
    implicitHeight: 20

    signal clicked()
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
            width: 90
            height: 20
            anchors.right: parent.right
            CustomButton{
                id: saveTest
                width: 51
                height: 20
                text: "Select"
                butRadius: 4
                labelFontSize: 12
                onClicked: root.clicked()
            }
            Text {
                id: editButton
                text: "Edit"
                font.pixelSize: 14
                font.family: "Work Sans"
                anchors.right: parent.right
                color: "#059669"
            }
        }
    }
}
