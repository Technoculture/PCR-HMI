import QtQuick 2.15
import QtQuick.Controls 1.4
import "../Components"

Item {
    id:root
    Rectangle{
        anchors.fill: parent
        color: "#A7F3D0"
        Rectangle{
            width: 667
            height: 413
            anchors.centerIn: parent
            radius: 8
            Grid{
                width: parent.width-60
                height: parent.height-60
                anchors.centerIn: parent
                rows: 4
                rowSpacing: 32
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
                            onClicked: settingsPage.visible=false
                        }
                        Text {
                            id: settings
                            text: "Patient Details"
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
                    height: 213
                    color: "#D1FAE5"
                    Rectangle{
                        id: slotTabs
                        width: parent.width
                        height: 36
                        color: "white"
                        anchors.top: parent.top
                        Grid{
                            columns: 4
                            columnSpacing: 5
                            SlotPatientTab{
                                id: slot1
                                text: "MTB"
                                textColor: "black"
                                iconSource: "Down_Arrow.png"
                                onClicked: {
                                    slot1.tabColor = "#D1FAE5"
                                    slot2.tabColor = "#E2E8F0"
                                    slot3.tabColor = "#E2E8F0"
                                    slot4.tabColor = "#E2E8F0"
                                }
                            }
                            SlotPatientTab{
                                id: slot2
                                text: "Slot 2"
                                textColor: "black"
                                iconSource: "Down_Arrow.png"
                                tabColor: "#D1FAE5"
                                onClicked: {
                                    slot1.tabColor = "#E2E8F0"
                                    slot2.tabColor = "#D1FAE5"
                                    slot3.tabColor = "#E2E8F0"
                                    slot4.tabColor = "#E2E8F0"
                                }
                            }
                            SlotPatientTab{
                                id: slot3
                                text: "Slot 3"
                                textColor: "black"
                                iconSource: "Down_Arrow.png"
                                onClicked: {
                                    slot1.tabColor = "#E2E8F0"
                                    slot2.tabColor = "#E2E8F0"
                                    slot3.tabColor = "#D1FAE5"
                                    slot4.tabColor = "#E2E8F0"
                                }
                            }
                            SlotPatientTab{
                                id: slot4
                                text: "Slot 4"
                                textColor: "black"
                                iconSource: "Down_Arrow.png"
                                onClicked: {
                                    slot1.tabColor = "#E2E8F0"
                                    slot2.tabColor = "#E2E8F0"
                                    slot3.tabColor = "#E2E8F0"
                                    slot4.tabColor = "#D1FAE5"
                                }
                            }
                        }
                    }
                    Rectangle{
                        id: infoInput
                        width: parent.width
                        height: 107
                        anchors.top: slotTabs.bottom
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.topMargin: 20
                        color: "transparent"
                        Grid{
                            columns: 2
                            rows: 3
                            anchors.horizontalCenter: parent.horizontalCenter
                            rowSpacing: 15
                            columnSpacing: 15
                            InputBox{
                                placehText: "Referred Doctor"
                            }
                            InputBox{
                                placehText: "Patient's ID"
                            }
                            InputBox{
                                placehText: "Patient's Name"
                            }
                            InputBox{
                                placehText: "Patient's Age"
                            }
                        }
                    }
                    Rectangle{
                        id: extraInfo
                        width: parent.width-20
                        height: 36
                        color: "transparent"
                        anchors.bottomMargin: 15
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.bottom: parent.bottom
                        Rectangle{
                            width: 157
                            height: parent.height
                            color: "transparent"
                            Row{
                                anchors.fill: parent
                                spacing: 30
                                ExclusiveGroup{id: group}
                                RadioButton{
                                    checked: true
                                    text: "Male"
                                    exclusiveGroup: group
                                    anchors.verticalCenter: parent.verticalCenter
                                }
                                RadioButton{
                                    text: "Female"
                                    exclusiveGroup: group
                                    anchors.verticalCenter: parent.verticalCenter
                                }
                            }
                        }
                        Button{
                            id: chooseTest
                            width: 114
                            height: parent.height
                            anchors.right: parent.right
                            text: "Choose Test"
                            labelFontSize: 14
                            butRadius: 4
                        }
                    }
                }
                Button{
                    id: done
                    width: 66
                    height: 36
                    text: "Done"
                    labelFontSize: 14
                    butRadius: 4
                }
            }
        }
    }
}
