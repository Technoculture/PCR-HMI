import QtQuick 2.15
import QtQuick.Controls 1.4
import "../Components"

Item {
    id:root

    signal requestPatientDetails(var slotNumber)
    signal requestResults()
    signal requestBack()
    Rectangle{
        anchors.fill: parent
        color: "#A7F3D0"
        Rectangle{
            width: 523
            height: 428
            anchors.centerIn: parent
            radius: 4
            Grid{
                width: parent.width-60
                height: parent.height-40
                anchors.centerIn: parent
                rows: 2
                rowSpacing: 30
                Rectangle{
                    id: heading
                    width: parent.width
                    height: logo.height
                    Grid{
                        columns: 2
                        columnSpacing: 30
                        FuncButton{
                            id: back
                            height: logo.height
                            text: "Signout"
                            textColor: "#64748B"
                            labelFontSize: 16
                            iconSource: "SignOut.png"
                            onClicked: requestBack()
                        }
                        Text {
                            id: settings
                            text: "Choose a Slot"
                            font.family: "Work Sans Medium"
                            font.pixelSize: 16
                            color: "#475569"
                            height: logo.height
                            padding: 8
                        }
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
                    width: parent.width
                    height: 318
                    Grid{
                        rows: 2
                        rowSpacing: 15
                        anchors.fill: parent
                        Grid{
                            id: preTest
                            width: body.width
                            height: body.height-51
                            columns: 2
                            rows: 2
                            columnSpacing: 23
                            rowSpacing: 23
                            SlotsDetails{
                                id: slot1
                                slotNo: 1
                                testName: detailsTable.roleFromRow(0,"test_name") ? detailsTable.roleFromRow(0,"test_name") : "No Data"
                                patientName: detailsTable.roleFromRow(0,"patient_name") ? detailsTable.roleFromRow(0,"patient_name") : "No Data"
                                onClicked: requestPatientDetails(1)
                            }
                            SlotsDetails{
                                id: slot2
                                slotNo: 2
                                testName: detailsTable.roleFromRow(1,"test_name") ? detailsTable.roleFromRow(1,"test_name") : "No Data"
                                patientName: detailsTable.roleFromRow(1,"patient_name") ? detailsTable.roleFromRow(1,"patient_name") : "No Data"
                                onClicked: requestPatientDetails(2)
                            }
                            SlotsDetails{
                                id: slot3
                                slotNo: 3
                                testName: detailsTable.roleFromRow(2,"test_name") ? detailsTable.roleFromRow(2,"test_name") : "No Data"
                                patientName: detailsTable.roleFromRow(2,"patient_name") ? detailsTable.roleFromRow(2,"patient_name") : "No Data"
                                onClicked: requestPatientDetails(3)
                            }
                            SlotsDetails{
                                id: slot4
                                slotNo: 4
                                testName: detailsTable.roleFromRow(3,"test_name") ? detailsTable.roleFromRow(3,"test_name") : "No Data"
                                patientName: detailsTable.roleFromRow(3,"patient_name") ? detailsTable.roleFromRow(3,"patient_name") : "No Data"
                                onClicked: requestPatientDetails(4)
                            }
                        }
                        Rectangle{
                            id: footer
                            width: body.width
                            height: 36
                            CustomButton{
                                id: startTests
                                width: 84
                                height: parent.height
                                text: "Start Tests"
                                labelFontSize: 12
                                butRadius: 4
                                onClicked: {
                                    var remain="";
                                    if(slot1.testName=="No Data")remain+=" 1";
                                    if(slot2.testName=="No Data")remain+=" 2";
                                    if(slot3.testName=="No Data")remain+=" 3";
                                    if(slot4.testName=="No Data")remain+=" 4";
                                    if(remain!="")
                                        message.text="Remaining SLots to fill:"+remain;
                                    else{
                                        requestResults()
                                    }
                                }
                            }
                            Text {
                                id: message
                                text: ""
                                color: "#DC2626"
                                font.family: "Work Sans Medium"
                                anchors.right: parent.right
                                anchors.verticalCenter: parent.verticalCenter
                            }
                        }
                    }
                }
            }
        }
    }
}
