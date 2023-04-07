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
                rows: 3
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
                    Rectangle{
                        width: body.width
                        height: 136
                        anchors.top: parent.top
                        anchors.margins: 10
                        Grid{
                            columns: 2
                            rows: 2
                            anchors.fill: parent
                            rowSpacing: 15
                            columnSpacing: 15
                            InputBox{
                                placeholderText: "Referred Doctor"
                            }
                            InputBox{
                                placeholderText: "Patient's ID"
                            }
                            InputBox{
                                placeholderText: "Patient's Name"
                            }
                            InputBox{
                                placeholderText: "Patient's Age"
                            }
                        }
                    }
                    Rectangle{
                        id: extraInfo
                        width: parent.width
                        height: 36
                        anchors.bottom: parent.bottom
                        Rectangle{
                            width: 157
                            height: parent.height
                            Row{
                                spacing: 30
                                ExclusiveGroup{id: group}
                                RadioButton{
                                    checked: true
                                    text: "Male"
                                    exclusiveGroup: group
                                }
                                RadioButton{
                                    text: "Female"
                                    exclusiveGroup: group
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
