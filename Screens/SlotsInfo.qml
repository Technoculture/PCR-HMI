import QtQuick 2.15
import QtQuick.Controls 1.4
import "../Components"

Item {
    id:root

    signal requestPatientDetails()
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
                                slotNo: 1
                                testName: "MTB"
                                patientName: "Ashok Singh"
                                onClicked: requestPatientDetails()
                            }
                            SlotsDetails{
                                slotNo: 2
                                testName: "MTB Plus"
                                patientName: "Rashid Khan"
                                onClicked: requestPatientDetails()
                            }
                            SlotsDetails{
                                slotNo: 3
                                testName: "MTB"
                                patientName: "Rashmi Singh"
                                onClicked: requestPatientDetails()
                            }
                            SlotsDetails{
                                slotNo: 4
                                onClicked: requestPatientDetails()
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
                                onClicked: requestResults()
                            }
                            Text {
                                id: message
                                text: "Error in Slot 4. Please try again."
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
