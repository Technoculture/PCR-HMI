import QtQuick 2.15

Item {
    id: root
    implicitWidth: 219
    implicitHeight: 122

    property int slotNo: 0
    property string testName: "No Data"
    property string patientName: "No Data"
    Rectangle{
        anchors.fill: parent
        color: (testName != "No Data" || patientName != "No Data") ? "#34D399" : "#94A3B8"
        radius: 4
        Grid{
            anchors.centerIn: parent
            rows: 2
            rowSpacing: 15
            Rectangle{
                width: root.width-40
                height: 20
                color: "transparent"
                Text {
                    id: slotName
                    text: "Slot "+slotNo
                    font.family: "Work Sans Medium"
                    font.pixelSize: 14
                    color: "#F8FAFC"
                    anchors.verticalCenter: parent.verticalCenter
                }
            }
            Rectangle{
                id: details
                width: root.width-40
                height: 47
                color: "transparent"
                Rectangle{
                    id: test
                    width: parent.width/2
                    height: parent.height/2
                    color: "transparent"
                    Text {
                        text: "Test"
                        font.pixelSize: 14
                        font.family: "Work Sans"
                        color: "#F8FAFC"
                    }
                }
                Rectangle{
                    id: test1
                    width: parent.width/2
                    height: parent.height/2
                    anchors.right: parent.right
                    color: "transparent"
                    Text {
                        text: testName
                        font.pixelSize: 14
                        font.family: "Work Sans Medium"
                        color: "#F8FAFC"
                    }
                }
                Rectangle{
                    id: patient
                    width: parent.width/2
                    height: parent.height/2
                    color: "transparent"
                    anchors.bottom: parent.bottom
                    Text {
                        text: "Name"
                        font.pixelSize: 14
                        font.family: "Work Sans"
                        color: "#F8FAFC"
                    }
                }
                Rectangle{
                    id: patient1
                    width: parent.width/2
                    height: parent.height/2
                    anchors.right: parent.right
                    color: "transparent"
                    anchors.bottom: parent.bottom
                    Text {
                        text: patientName
                        font.pixelSize: 14
                        font.family: "Work Sans Medium"
                        color: "#F8FAFC"
                    }
                }
            }
        }
    }
}
