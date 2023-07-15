import QtQuick 2.15
import QtQuick.Controls 1.4
import "../Components"
//import "../Screens/Results.qml"

Item {
    id:root
    signal requestPresetTest(var slotNumber)
    signal requestSlots()
    signal requestTray()

    property string testName1: "Slot 1"
    property string testName2: "Slot 2"
    property string testName3: "Slot 3"
    property string testName4: "Slot 4"
    property int number: -1
    property int index: -1
    property string currentState: number.toString()
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
                            onClicked: requestTray()
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
                        state: currentState
                        Grid{
                            columns: 4
                            columnSpacing: 5
                            SlotPatientTab{
                                id: slot1
                                text: testName1
                                textColor: "black"
                                iconSource: "Down_Arrow.png"
                                tabColor: "#D1FAE5"
                                onClicked: {
                                    slotTabs.state="1"
                                    number=1
                                }
                            }
                            SlotPatientTab{
                                id: slot2
                                text: testName2
                                textColor: "black"
                                iconSource: "Down_Arrow.png"
                                onClicked: {
                                    slotTabs.state="2"
                                    number=2
                                }
                            }
                            SlotPatientTab{
                                id: slot3
                                text: testName3
                                textColor: "black"
                                iconSource: "Down_Arrow.png"
                                onClicked: {
                                    slotTabs.state="3"
                                    number=3
                                }
                            }
                            SlotPatientTab{
                                id: slot4
                                text: testName4
                                textColor: "black"
                                iconSource: "Down_Arrow.png"
                                onClicked: {
                                    slotTabs.state="4"
                                    number=4
                                }
                            }
                        }
                        states: [
                            State {
                                name: "1"
                                PropertyChanges { target: slot1; tabColor: "#D1FAE5" }
                                PropertyChanges { target: slot2; tabColor: "#E2E8F0" }
                                PropertyChanges { target: slot3; tabColor: "#E2E8F0" }
                                PropertyChanges { target: slot4; tabColor: "#E2E8F0" }
                            },
                            State {
                                name: "2"
                                PropertyChanges { target: slot2; tabColor: "#D1FAE5" }
                                PropertyChanges { target: slot1; tabColor: "#E2E8F0" }
                                PropertyChanges { target: slot3; tabColor: "#E2E8F0" }
                                PropertyChanges { target: slot4; tabColor: "#E2E8F0" }
                            },
                            State {
                                name: "3"
                                PropertyChanges { target: slot3; tabColor: "#D1FAE5" }
                                PropertyChanges { target: slot2; tabColor: "#E2E8F0" }
                                PropertyChanges { target: slot1; tabColor: "#E2E8F0" }
                                PropertyChanges { target: slot4; tabColor: "#E2E8F0" }
                            },
                            State {
                                name: "4"
                                PropertyChanges { target: slot4; tabColor: "#D1FAE5" }
                                PropertyChanges { target: slot2; tabColor: "#E2E8F0" }
                                PropertyChanges { target: slot3; tabColor: "#E2E8F0" }
                                PropertyChanges { target: slot1; tabColor: "#E2E8F0" }
                            }
                        ]
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
                                id: doctor
                                placehText: "Referred Doctor"
                            }
                            InputBox{
                                id: patientID
                                placehText: "Patient's ID"
                            }
                            InputBox{
                                id: patientName
                                placehText: "Patient's Name"
                            }
                            InputBox{
                                id: age
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
                                    id: male
                                    checked: true
                                    exclusiveGroup: group
                                    text: "Male"
                                    anchors.verticalCenter: parent.verticalCenter
                                }
                                RadioButton{
                                    id: female
                                    exclusiveGroup: group
                                    text: "Female"
                                    anchors.verticalCenter: parent.verticalCenter
                                }
                            }
                        }
                        CustomButton{
                            id: chooseTest
                            width: 114
                            height: parent.height
                            anchors.right: parent.right
                            text: "Choose Test"
                            labelFontSize: 14
                            butRadius: 4
                            onClicked: {
                                requestPresetTest(number)
                            }
                        }
                    }
                }
                CustomButton{
                    id: done
                    width: 66
                    height: 36
                    text: "Done"
                    labelFontSize: 14
                    butRadius: 4
                    onClicked: {
                        if(doctor.inputText==""){
                            doctor.myBorder="#F02D1F"
                            if(patientID.inputText!="")
                                patientID.myBorder="#64748B"
                            if(patientName.inputText!="")
                                patientName.myBorder="#64748B"
                            if(age.inputText!="")
                                age.myBorder="#64748B"
                        }
                        if(patientID.inputText==""){
                            patientID.myBorder="#F02D1F"
                            if(doctor.inputText!="")
                                doctor.myBorder="#64748B"
                            if(patientName.inputText!="")
                                patientName.myBorder="#64748B"
                            if(age.inputText!="")
                                age.myBorder="#64748B"
                        }
                        if(patientName.inputText==""){
                            patientName.myBorder="#F02D1F"
                            if(patientID.inputText!="")
                                patientID.myBorder="#64748B"
                            if(doctor.inputText!="")
                                doctor.myBorder="#64748B"
                            if(age.inputText!="")
                                age.myBorder="#64748B"
                        }
                        if(age.inputText==""){
                            age.myBorder="#F02D1F"
                            if(patientID.inputText!="")
                                patientID.myBorder="#64748B"
                            if(patientName.inputText!="")
                                patientName.myBorder="#64748B"
                            if(doctor.inputText!="")
                                doctor.myBorder="#64748B"
                        }
                        if(doctor.inputText!="" && patientID.inputText!="" && patientName.inputText!="" && age.inputText!=""){
                            var selectedTest;
                            if(number===1)selectedTest=testName1;
                            else if(number===2)selectedTest=testName2;
                            else if(number===3)selectedTest=testName3;
                            else if(number===4)selectedTest=testName4;
                            var data = patientID.inputText+";";
                            data += number+";";
                            data += patientName.inputText+";";
                            data += ((male.checked===true)?"Male":"Female")+";";
                            data += age.inputText+";";
                            data += selectedTest+";";
                            data += doctor.inputText+";";
                            data += Qt.formatTime(new Date(),"hh:mm:ss")+";";

                            detailsTable.addRow(root.index,data);
                            requestSlots()
                        }
                    }
                }
            }
        }
    }
}
