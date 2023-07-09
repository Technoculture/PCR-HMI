import QtQuick 2.15
import QtQuick.Controls 1.4
import "../Components"

Item {
    id:root

    signal requestSettings()
    Rectangle{
        anchors.fill: parent
        color: "#A7F3D0"
        Rectangle{
            id: main
            width: 647
            height: 367
            anchors.centerIn: parent
            radius: 8
            Grid{
                width: parent.width-60
                height: parent.height-60
                anchors.centerIn: parent
                rows: 3
                rowSpacing: 23
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
                            onClicked: {
                                customTest.visible=false
                                login.visible=true
                            }
                        }
                        Text {
                            id: settings
                            text: "Custom Test"
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
                    width: parent.width
                    height: 240
                    Grid{
                        columns: 2
                        columnSpacing: 37
                        Rectangle{
                            width: 240
                            height: parent.height
                            color: "#ECFDF5"
                            Grid{
                                columns: 1
                                anchors.centerIn: parent
                                rowSpacing: 14
                                ToggleValue{
                                    id: rtprocess
                                    testText: "RT Process"
                                }
                                ToggleValue{
                                    id: hotprocess
                                    testText: "Hot Start"
                                }
                                ToggleValue{
                                    id: denaturation
                                    testText: "Denaturation"
                                }
                                ToggleValue{
                                    id: annealing
                                    testText: "Annealing"
                                }
                                ToggleValue{
                                    id: extension
                                    testText: "Extension"
                                }
                                ToggleValue{
                                    id: final_ext
                                    testText: "Final Extension"
                                }
                            }
                        }
                        Rectangle{
                            width: 308
                            height: 244
                            anchors.topMargin: 10
                            Grid{
                                columns: 1
                                rowSpacing: 14
                                Rectangle{
                                    width: 308
                                    height: 36
                                    InputValue{
                                        id: temperature
                                        testText: "Temperature (°C)"
                                        anchors.centerIn: parent
                                    }
                                }
                                Rectangle{
                                    width: 308
                                    height: 36
                                    InputValue{
                                        id: time
                                        testText: "Time (sec)"
                                        anchors.centerIn: parent
                                    }
                                }
                                Rectangle{
                                    width: 308
                                    height: 124
                                    radius: 4
                                    color: "#A7F3D0"
                                    Grid{
                                        columns: 1
                                        rowSpacing: 22
                                        anchors.centerIn: parent
                                        InputValue{
                                            id: loop
                                            testText: "Loop"
                                            testValue: "39"
                                            fixed: true
                                        }
                                        CustomButton{
                                            id: save
                                            width: 275
                                            height: 36
                                            text: "Save"
                                            labelFontSize: 14
                                            butRadius: 4
                                            onClicked: {
                                                var data="";
                                                data+=settings.text+";";
                                                data+=rtprocess.myValue+";";
                                                data+=hotprocess.myValue+";";
                                                data+=denaturation.mmyValue+";";
                                                data+=annealing.myValue+";";
                                                data+=extension.myValue+";";
                                                data+=final_ext.myValue+";";
                                                data+=temperature.testValue+";";
                                                data+=time.testValue+";";
                                                data+=loop.testValue+";";

                                                testsTable.addRow(-1,data);

                                                requestSettings()
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
    }
}
