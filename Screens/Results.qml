import QtQuick 2.15
import QtQuick.Controls 1.4
import "../Components"

Item {
    id:root

    signal requestTray()
    signal requestSlots()
    property int index: -1
    Rectangle{
        anchors.fill: parent
        color: "#A7F3D0"
        Rectangle{
            width: 597
            height: 382
            anchors.centerIn: parent
            radius: 8
            Grid{
                width: parent.width-60
                height: parent.height-60
                anchors.centerIn: parent
                rows: 2
                rowSpacing: 20
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
                            text: "Back"
                            textColor: "#64748B"
                            labelFontSize: 16
                            iconSource: "BackArrowIcon.png"
                            onClicked: requestSlots()
                        }
                        Text {
                            id: settings
                            text: "Result"
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
                    height: parent.height-heading.height-30
                    Grid{
                        rows: 1
                        columns: 3
                        columnSpacing: 47
                        Rectangle{
                            width: 122
                            height: 136
                            Grid{
                                columns: 1
                                rows: 3
                                anchors.fill: parent
                                rowSpacing: 14
                                Text {
                                    id: doctor
                                    text: "Test Details"
                                    padding: 10
                                    color: "#059669"
                                    font.pixelSize: 14
                                    font.family: "Work Sans Medium"
                                    MouseArea{
                                        id: ma1
                                        anchors.fill: parent
                                        onClicked: body.state="TestDetails"
                                    }
                                }
                                Text {
                                    id: patient
                                    text: "Patient Details"
                                    padding: 10
                                    color: "#475569"
                                    font.pixelSize: 14
                                    font.family: "Work Sans Medium"
                                    MouseArea{
                                        id: ma2
                                        anchors.fill: parent
                                        onClicked: body.state="PatientDetails"
                                    }
                                }
                                Text {
                                    id: test
                                    text: "Test Results"
                                    padding: 10
                                    color: "#475569"
                                    font.pixelSize: 14
                                    font.family: "Work Sans Medium"
                                    MouseArea{
                                        id: ma3
                                        anchors.fill: parent
                                        onClicked: body.state="TestResult"
                                    }
                                }
                            }
                        }
                        Rectangle{
                            width: 1
                            height: 200
                            color: "#E2E8F0"
                        }
                        Rectangle{
                            id: infoDetails
                            width: 322
                            height: 252
//                            visible: false
                            Grid{
                                columns: 1
                                rows: 5
                                rowSpacing: 15
                                anchors.fill: parent
                                DataValue{
                                    id: title1
                                    width: parent.width
                                    height: 29
                                    dataContent: "Referred by"
                                    dataValueContent: detailsTable.roleFromRow(index,"doctor")
                                    topPaddingExtra: 0
                                }
                                DataValue{
                                    id: title2
                                    width: parent.width
                                    dataContent: "Date"
                                    dataValueContent: "12-07-2023"
                                }
                                DataValue{
                                    id: title3
                                    width: parent.width
                                    dataContent: "Time"
                                    dataValueContent: Qt.formatTime(new Date(),"hh:mm")
                                }
                                DataValue{
                                    id: title4
                                    width: parent.width
                                    dataContent: "Test Name"
                                    dataValueContent: detailsTable.roleFromRow(index,"test_name")
                                }
                            }
                            CustomButton{
                                id: save
                                width: 96
                                height: 36
                                text: "Save"
                                labelFontSize: 14
                                butRadius: 4
                                anchors.bottom: parent.bottom
                                onClicked: {
                                    var data="";
                                    if(body.state==="TestDetails"){
                                        data+=title1.dataContent+";";
                                    }

                                    if(body.state==="TestResult"){
                                        data+=title1.dataValueContent+";";
                                        data+=title2.dataValueContent+";";
                                        data+=title3.dataValueContent+";";
                                        data+=title4.dataValueContent+";";
                                        data += Qt.formatTime(new Date(),"hh:mm:ss")+";";
                                        resultsTable.addRow(-1,data);

                                        requestTray()
                                    }
                                }
                            }
                        }
                    }
                    states: [
                        State {
                            name: "TestDetails"
                            PropertyChanges { target: doctor; color: "#059669" }
                            PropertyChanges { target: patient; color: "#475569"}
                            PropertyChanges { target: test; color: "#475569"}
                            PropertyChanges { target: title1; dataContent: "Referred by"; dataValueContent: detailsTable.roleFromRow(index,"doctor") }
                            PropertyChanges { target: title2; dataContent: "Date"; dataValueContent: "27-03-2023" }
                            PropertyChanges { target: title3; dataContent: "Time"; dataValueContent: detailsTable.roleFromRow(index,"timestamp") }
                            PropertyChanges { target: title4; dataContent: "Test Name"; dataValueContent: detailsTable.roleFromRow(index,"test_name") }
                        },
                        State {
                            name: "PatientDetails"
                            PropertyChanges { target: doctor; color: "#475569" }
                            PropertyChanges { target: patient; color: "#059669"}
                            PropertyChanges { target: test; color: "#475569"}
                            PropertyChanges { target: title1; dataContent: "Patient ID"; dataValueContent: detailsTable.roleFromRow(index,"patient_id") }
                            PropertyChanges { target: title2; dataContent: "Name"; dataValueContent: detailsTable.roleFromRow(index,"patient_name") }
                            PropertyChanges { target: title3; dataContent: "Age"; dataValueContent: detailsTable.roleFromRow(index,"age") }
                            PropertyChanges { target: title4; dataContent: "Sex"; dataValueContent: detailsTable.roleFromRow(index,"sex") }
                        },
                        State {
                            name: "TestResult"
                            PropertyChanges { target: doctor; color: "#475569" }
                            PropertyChanges { target: patient; color: "#475569"}
                            PropertyChanges { target: test; color: "#059669"}
                            PropertyChanges { target: title1; dataContent: "Control C"; dataValueContent: "24.5" }
                            PropertyChanges { target: title2; dataContent: "Run Status"; dataValueContent: "Valid" }
                            PropertyChanges { target: title3; dataContent: "MTB Amount"; dataValueContent: "27.0" }
                            PropertyChanges { target: title4; dataContent: "MTB Detected"; dataValueContent: "4.1 x 10 CFU/ml" }
                        }
                    ]
                }
            }
        }
    }
}
