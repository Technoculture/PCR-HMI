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
                                width: 148
                                text: detailsTable.roleFromRow(0,"test_name")?detailsTable.roleFromRow(0,"test_name"):testName1
                                textColor: "black"
                                iconSource: testName1=="Slot 1"?"Down_Arrow.png":"Slot done.png"
                                tabColor: "#D1FAE5"
                                onClicked: {
                                    slotTabs.state="1"
                                    number=1
                                }
                            }
                            SlotPatientTab{
                                id: slot2
                                width: 148
                                text: detailsTable.roleFromRow(1,"test_name")?detailsTable.roleFromRow(1,"test_name"):testName2
                                textColor: "black"
                                iconSource: testName2=="Slot 2"?"Down_Arrow.png":"Slot done.png"
                                onClicked: {
                                    slotTabs.state="2"
                                    number=2
                                }
                            }
                            SlotPatientTab{
                                id: slot3
                                width: 148
                                text: detailsTable.roleFromRow(2,"test_name")?detailsTable.roleFromRow(2,"test_name"):testName3
                                textColor: "black"
                                iconSource: testName3=="Slot 3"?"Down_Arrow.png":"Slot done.png"
                                onClicked: {
                                    slotTabs.state="3"
                                    number=3
                                }
                            }
                            SlotPatientTab{
                                id: slot4
                                width: 148
                                text: detailsTable.roleFromRow(3,"test_name")?detailsTable.roleFromRow(3,"test_name"):testName4
                                textColor: "black"
                                iconSource: testName4=="Slot 4"?"Down_Arrow.png":"Slot done.png"
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
                                inputText: detailsTable.roleFromRow(number-1,"doctor")?detailsTable.roleFromRow(number-1,"doctor"):""
                                onShowKeyboard: virtualKeyboard.visible=true
                            }
                            InputBox{
                                id: patientID
                                placehText: "Patient's ID"
                                inputText: detailsTable.roleFromRow(number-1,"patient_id")?detailsTable.roleFromRow(number-1,"patient_id"):""
                                onShowKeyboard: virtualKeyboard.visible=true
                            }
                            InputBox{
                                id: patientName
                                placehText: "Patient's Name"
                                inputText: detailsTable.roleFromRow(number-1,"patient_name")?detailsTable.roleFromRow(number-1,"patient_name"):""
                                onShowKeyboard: virtualKeyboard.visible=true
                            }
                            InputBox{
                                id: age
                                placehText: "Patient's Age"
                                inputText: detailsTable.roleFromRow(number-1,"age")?detailsTable.roleFromRow(number-1,"age"):""
                                onShowKeyboard: virtualKeyboard.visible=true
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
                                    checked: detailsTable.roleFromRow(number-1,"sex") ? (detailsTable.roleFromRow(number-1,"sex")==="Male" ? true : false) : true;
                                    exclusiveGroup: group
                                    text: "Male"
                                    anchors.verticalCenter: parent.verticalCenter
                                }
                                RadioButton{
                                    id: female
                                    checked: !male.checked
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
                Rectangle{
                    id: doneButton
                    width: parent.width
                    height: done.height
                    CustomButton{
                        id: done
                        width: 66
                        height: 36
                        text: "Done"
                        labelFontSize: 14
                        butRadius: 4
                        onClicked: {
                            var selectedTest;
                            if(number===1){
                                selectedTest=slot1.text;
                            }
                            else if(number===2){
                                selectedTest=slot2.text;
                            }
                            else if(number===3){
                                selectedTest=slot3.text;
                            }
                            else if(number===4){
                                selectedTest=slot4.text;
                            }

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
                            if(selectedTest.indexOf("Slot")!==-1){
                                alert.text="Choose test first!"
                            }

                            else if(doctor.inputText!="" && patientID.inputText!="" && patientName.inputText!=""
                                    && age.inputText!="" && selectedTest.indexOf("Slot")===-1){
                                var data = patientID.inputText+";";
                                data += number+";";
                                data += patientName.inputText+";";
                                data += ((male.checked===true)?"Male":"Female")+";";
                                data += age.inputText+";";
                                data += selectedTest+";";
                                data += doctor.inputText+";";
                                data += Qt.formatTime(new Date(),"hh:mm:ss")+";";

                                if(detailsTable.roleFromRow(number-1,"patient_id"))
                                    detailsTable.addRow(number-1,data);
                                else
                                    detailsTable.addRow(index,data);
                                requestSlots()
                            }
                        }
                    }
                    Text {
                        id: alert
                        text: ""
                        font.family: "Work Sans Medium"
                        font.pixelSize: 16
                        color: "#475569"
                        leftPadding: 10
                        anchors.left: done.right
                        anchors.verticalCenter: done.verticalCenter
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
                done.clicked()
            }
        }
    }
}
