import QtQuick 2.15
import QtQuick.Controls 1.4
import "../Components"

Item {
    id:root

    signal requestSettings()
    property string testName: "Custom Test"
    property int index: -1
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
                                requestSettings()
                            }
                        }
                        Text {
                            id: settings
                            text: testName
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
                                        propText: "Temperature (°C)"
                                        anchors.centerIn: parent
                                        onClicked: virtualKeyboard.visible=true
                                    }
                                }
                                Rectangle{
                                    width: 308
                                    height: 36
                                    InputValue{
                                        id: time
                                        propText: "Time (sec)"
                                        anchors.centerIn: parent
                                        onClicked: virtualKeyboard.visible=true
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
                                            propText: "Loop"
                                            propValue: "39"
                                            set: true
                                        }
                                        CustomButton{
                                            id: save
                                            width: 275
                                            height: 36
                                            text: "Save"
                                            labelFontSize: 14
                                            butRadius: 4
                                            onClicked: {
                                                if(temperature.propValue==""){
                                                    temperature.myborder="#F02D1F"
                                                }
                                                if(time.propValue==""){
                                                    time.myborder="#F02D1F"
                                                }
                                                if(temperature.propValue!="" && time.propValue!=""){
                                                    var data="";
                                                    data+=settings.text+";";
                                                    data+=rtprocess.myValue+";";
                                                    data+=hotprocess.myValue+";";
                                                    data+=denaturation.myValue+";";
                                                    data+=annealing.myValue+";";
                                                    data+=extension.myValue+";";
                                                    data+=final_ext.myValue+";";
                                                    data+=temperature.propValue+";";
                                                    data+=time.propValue+";";
                                                    data+=loop.propValue+";";

                                                    testsTable.addRow(index,data);

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
        Keyboard {
            id: virtualKeyboard
            focus: false
            anchors.bottom: parent.bottom
            visible: false
            onKeyPressed: {
                var cursorPos = activeFocusItem.cursorPosition
                activeFocusItem.text = activeFocusItem.text.slice(0, cursorPos) + key + activeFocusItem.text.slice(cursorPos, activeFocusItem.text.length)
                activeFocusItem.cursorPosition = Math.max(0, cursorPos + key.length)
            }
            onBackspacePressed: {
                var cursorPos = activeFocusItem.cursorPosition
                activeFocusItem.text = activeFocusItem.text.slice(0, cursorPos -1) + activeFocusItem.text.slice(cursorPos, activeFocusItem.text.length)
                activeFocusItem.cursorPosition = Math.max(0, cursorPos - 1)
            }
            onDeletePressed: {
                var cursorPos = activeFocusItem.cursorPosition
                activeFocusItem.text = activeFocusItem.text.slice(0, cursorPos) + activeFocusItem.text.slice(cursorPos+1, activeFocusItem.text.length)
                activeFocusItem.cursorPosition = Math.max(0, cursorPos)
            }
            onEnterPressed: {
                save.clicked()
            }
        }
    }
}
