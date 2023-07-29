import QtQuick 2.15
import QtQuick.Controls 1.4
import "../Components"

Item {
    id:root

    signal requestTray()
    property int index: -1
    property int number: -1
    Rectangle{
        anchors.fill: parent
        color: "#D1FAE5"
        Rectangle{
            width: 667
            height: 430
            anchors.centerIn: parent
            radius: 8
            Grid{
                width: parent.width-50
                height: parent.height-50
                anchors.centerIn: parent
                rows: 2
                rowSpacing: 20
                Rectangle{
                    id: heading
                    width: parent.width
                    height: logo.height
                    Text {
                        id: settings
                        text: "Result"
                        font.family: "Work Sans Medium"
                        font.pixelSize: 16
                        color: "#475569"
                        height: logo.height
                        padding: 8
                    }
                    Image {
                        id: logo
                        source: "../Assets/Tcr Logo.png"
                        anchors.right: parent.right
                        width: 40
                        height: 40
                    }
                }
                Rectangle{
                    id: body
                    width: parent.width-1
                    height: parent.height-heading.height-25
                    Grid{
                        rows: 2
                        rowSpacing: 25
                        anchors.fill: parent
                        Rectangle{
                            id: finalResult
                            width: parent.width
                            height: 270
                            color: "#A7F3D0"
                            Rectangle{
                                id: slotTabs
                                width: parent.width
                                height: 36
                                color: "white"
                                anchors.top: parent.top
                                Grid{
                                    columns: 4
                                    columnSpacing: 4
                                    SlotPatientTab{
                                        id: slot1
//                                        text: "MTB"
                                        text: resultsTable.roleFromRow(0,"test_name")
                                        textColor: "black"
                                        iconSource: "Down_Arrow.png"
                                        tabColor: "#A7F3D0"
                                        opacity: text?1:0
                                        onClicked: {
                                            slotTabs.state="1"
                                            number=1
                                        }
                                    }
                                    SlotPatientTab{
                                        id: slot2
//                                        text: "Malaria"
                                        text: resultsTable.roleFromRow(1,"test_name")?resultsTable.roleFromRow(1,"test_name"):""
                                        textColor: "black"
                                        iconSource: "Down_Arrow.png"
                                        opacity: text?1:0
                                        onClicked: {
                                            slotTabs.state="2"
                                            number=2
                                        }
                                    }
                                    SlotPatientTab{
                                        id: slot3
                                        text: resultsTable.roleFromRow(2,"test_name")?resultsTable.roleFromRow(2,"test_name"):""
//                                        text: resultsTable.roleFromRow(2,"test_name")
                                        textColor: "black"
                                        iconSource: "Down_Arrow.png"
                                        opacity: text?1:0
                                        onClicked: {
                                            slotTabs.state="3"
                                            number=3
                                        }
                                    }
                                    SlotPatientTab{
                                        id: slot4
                                        text: resultsTable.roleFromRow(3,"test_name")?resultsTable.roleFromRow(3,"test_name"):""
//                                        text: resultsTable.roleFromRow(3,"test_name")
                                        textColor: "black"
                                        iconSource: "Down_Arrow.png"
                                        opacity: text?1:0
                                        onClicked: {
                                            slotTabs.state="4"
                                            number=4
                                        }
                                    }
                                }
                                states: [
                                    State {
                                        name: "1"
                                        PropertyChanges { target: slot1; tabColor: "#A7F3D0" }
                                        PropertyChanges { target: slot2; tabColor: "#D1FAE5" }
                                        PropertyChanges { target: slot3; tabColor: "#D1FAE5" }
                                        PropertyChanges { target: slot4; tabColor: "#D1FAE5" }
                                    },
                                    State {
                                        name: "2"
                                        PropertyChanges { target: slot2; tabColor: "#A7F3D0" }
                                        PropertyChanges { target: slot1; tabColor: "#D1FAE5" }
                                        PropertyChanges { target: slot3; tabColor: "#D1FAE5" }
                                        PropertyChanges { target: slot4; tabColor: "#D1FAE5" }
                                    },
                                    State {
                                        name: "3"
                                        PropertyChanges { target: slot3; tabColor: "#A7F3D0" }
                                        PropertyChanges { target: slot2; tabColor: "#D1FAE5" }
                                        PropertyChanges { target: slot1; tabColor: "#D1FAE5" }
                                        PropertyChanges { target: slot4; tabColor: "#D1FAE5" }
                                    },
                                    State {
                                        name: "4"
                                        PropertyChanges { target: slot4; tabColor: "#A7F3D0" }
                                        PropertyChanges { target: slot2; tabColor: "#D1FAE5" }
                                        PropertyChanges { target: slot3; tabColor: "#D1FAE5" }
                                        PropertyChanges { target: slot1; tabColor: "#D1FAE5" }
                                    }
                                ]
                            }
                            Rectangle{
                                id: results
                                width: parent.width
                                height: 230
                                anchors.bottom: parent.bottom
                                color: "transparent"
                                Grid{
                                    columns: 2
                                    columnSpacing: 10
                                    rowSpacing: 10
                                    anchors.fill: parent
                                    DataValue{
                                        id: title1
                                        width: results.width/2-5
                                        dataContent: "Patient Id"
                                        dataValueContent: resultsTable.roleFromRow(number-1,"patient_id")
                                    }
                                    DataValue{
                                        id: title2
                                        width: results.width/2-5
                                        dataContent: "Name"
                                        dataValueContent: resultsTable.roleFromRow(number-1,"patient_name")
                                    }
                                    DataValue{
                                        id: title3
                                        width: results.width/2-5
                                        dataContent: "Age"
                                        dataValueContent: resultsTable.roleFromRow(number-1,"age")
                                    }
                                    DataValue{
                                        id: title4
                                        width: results.width/2-5
                                        dataContent: "Sex"
                                        dataValueContent: resultsTable.roleFromRow(number-1,"sex")
                                    }
                                    DataValue{
                                        id: title5
                                        width: results.width/2-5
                                        dataContent: "Date"
                                        dataValueContent: resultsTable.roleFromRow(number-1,"date")
                                    }
                                    DataValue{
                                        id: title6
                                        width: results.width/2-5
                                        dataContent: "Time"
                                        dataValueContent: resultsTable.roleFromRow(number-1,"timestamp")
                                    }
                                    DataValue{
                                        id: title7
                                        width: results.width/2-5
                                        dataContent: "Test Name"
                                        dataValueContent: resultsTable.roleFromRow(number-1,"test_name")
                                    }
                                    DataValue{
                                        id: title8
                                        width: results.width/2-5
                                        dataContent: "Control C"
                                        dataValueContent: resultsTable.roleFromRow(number-1,"control_c")
                                    }
                                    DataValue{
                                        id: title9
                                        width: results.width/2-5
                                        dataContent: title7.dataValueContent + "\nAmount"
                                        dataValueContent: resultsTable.roleFromRow(number-1,"path_amount")
                                    }
                                    DataValue{
                                        id: title10
                                        width: results.width/2-5
                                        dataContent: title7.dataValueContent + "\nDetected"
                                        dataValueContent: resultsTable.roleFromRow(number-1,"path_detected")
                                    }
                                }
                            }
                        }
                        Rectangle{
                            id: doneResult
                            width: parent.width
                            height: 36
                            Grid{
                                columnSpacing: 15
                                anchors.fill: parent
                                CustomButton{
                                    id: printButton
                                    width: 70
                                    height: 36
                                    text: "Print"
                                    labelFontSize: 14
                                    butRadius: 4
                                    onClicked: requestTray()
                                }
                                CustomButton{
                                    id: doneButton
                                    width: 70
                                    height: 36
                                    text: "Done"
                                    labelFontSize: 14
                                    butRadius: 4
                                    onClicked: {
                                        var num=0;
                                        while(resultsTable.roleFromRow(num,"test_name")){
                                            detailsTable.removeRow(num);
                                            resultsTable.removeRow(num);
                                        }
                                        requestTray()
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}
