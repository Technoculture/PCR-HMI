import QtQuick 2.15
import QtQuick.Controls 1.4
import "../Components"

Item {
    id:root
    signal requestBack()
    signal requestCustomTest()

    property int row: 0
    Rectangle{
        anchors.fill: parent
        color: "#A7F3D0"
        Rectangle{
            width: 620
            height: 440
            anchors.centerIn: parent
            radius: 8
            Grid{
                width: parent.width-60
                height: parent.height-60
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
                            text: "Back"
                            textColor: "#64748B"
                            labelFontSize: 16
                            iconSource: "BackArrowIcon.png"
                            onClicked: requestBack()
                        }
                        Text {
                            id: settings
                            text: "Settings"
                            font.family: "Work Sans Medium"
                            font.pixelSize: 16
                            color: "#475569"
                            height: logo.height
                            padding: 10
                        }
                    }
                    Image {
                        id: logo
                        source: "../Assets/Tcr Logo.png"
                        anchors.right: parent.right
                    }
                }
                Rectangle{
                    id: body
                    width: parent.width
                    height: parent.height-heading.height-30
                    Grid{
                        rows: 1
                        columns: 2
                        columnSpacing: 60
                        Rectangle{
                            width: 227
                            height: 310
                            color: "#ECFDF5"
                            Grid{
                                columns: 1
                                anchors.fill: parent
                                rowSpacing: 20
                                SettingsItem{
                                    id: item1
                                    width: parent.width
                                    height: 46
                                    headText: "Wi-Fi"
                                    bodyText: "Connected"
                                    iconSource: "WifiIcon"
                                    onClicked: body.state="wifiSettings"
                                    bodyColor: "#A7F3D0"
                                }
                                SettingsItem{
                                    id: item2
                                    width: parent.width
                                    height: 46
                                    headText: "Update OS"
                                    bodyText: "1 New Update Available"
                                    iconSource: "system_update_alt 2"
                                    onClicked: body.state="updateSettings"
                                }
                                SettingsItem{
                                    id: item3
                                    width: parent.width
                                    height: 46
                                    headText: "Change Language"
                                    bodyText: "English (India)"
                                    iconSource: "translation 1"
                                    onClicked: body.state="langSettings"
                                }
                                SettingsItem{
                                    id: item4
                                    width: parent.width
                                    height: 46
                                    headText: "Change Timezone"
                                    bodyText: "India +05:30"
                                    iconSource: "UpdateIcon"
                                    onClicked: body.state="timeSettings"
                                }
                                SettingsItem{
                                    id: item5
                                    width: parent.width
                                    height: 46
                                    headText: "Custom Test"
                                    bodyText: "Define a Test"
                                    iconSource: "dashboard_custom"
                                    onClicked: body.state="customSettings"
                                }
                            }
                        }
                        Rectangle{
                            id: wifi
                            width: 256
                            height: 266
//                            visible: false
                            Rectangle{
                                id: wifiheading
                                width: parent.width-20
                                height: wifiHead.paintedHeight+21
                                Text {
                                    id: wifiHead
                                    text: "Available Networks"
                                    leftPadding: 10
                                    topPadding: 3
                                    font.letterSpacing: 0.5
                                    color: "#334155"
                                    font.family: "Work Sans Medium"
                                }
                            }
                            ListView {
                                anchors {
                                    fill: parent
                                    topMargin: 2;
                                    top: wifiheading.bottom
                                }
                                model: wifiInfoTable
                                delegate: WifiItems{
                                    id: wifi1
                                    wifiName: model.wifi_name
                                }
                                spacing: 2
                            }
                        }
                        Rectangle{
                            id: update
                            width: 290
                            height: 193
//                            color: "green"
                            visible: false
                            Rectangle{
                                id: updateOS
                                width: parent.width
                                height: updateHead.paintedHeight+21
                                anchors.horizontalCenter: parent.horizontalCenter
                                Text {
                                    id: updateHead
                                    text: "Update OS"
                                    leftPadding: 10
                                    topPadding: 3
                                    font.letterSpacing: 0.6
                                    color: "#475569"
                                    font.family: "Work Sans Medium"
                                }
                            }
                            Rectangle{
                                id: updateinfo
                                width: parent.width
                                height: updateHead.paintedHeight+31
                                anchors.top: updateOS.bottom
                                Text {
                                    id: updateText
                                    text: "1 update Available"
                                    leftPadding: 10
                                    topPadding: 10
                                    font.letterSpacing: 0.8
                                    color: "#64748B"
                                    font.family: "Work Sans Medium"
                                }
                            }
                            CustomButton{
                                id: download
                                width: 133
                                height: 36
                                text: "Download"
                                labelFontSize: 14
                                anchors.top: updateinfo.bottom
                                butRadius: 4
                            }
                        }
                        Rectangle{
                            id: language
                            width: 290
                            height: 81
                            visible: false
                            Rectangle{
                                id: changeLangHead
                                width: parent.width
                                height: 37
                                Text {
                                    id: languageHead
                                    text: "Choose Language"
                                    leftPadding: 10
                                    topPadding: 3
                                    font.letterSpacing: 0.6
                                    color: "#475569"
                                    font.family: "Work Sans Medium"
                                }
                            }
                            ComboBox {
                                currentIndex: 0
                                anchors.top: changeLangHead.bottom
                                model: ListModel {
                                    id: cbLangItems
                                    ListElement { text: "Choose your Language"}
                                    ListElement { text: "English (India)"}
                                    ListElement { text: "English (US)"}
                                    ListElement { text: "Hindi (India)"}
                                    ListElement { text: "Spanish (Spain)"}
                                }
                                width: parent.width
                                height: 44
                            }
                        }
                        Rectangle{
                            id: timezone
                            width: 290
                            height: 81
                            visible: false
                            Rectangle{
                                id: changeTimeHead
                                width: parent.width
                                height: 37
                                Text {
                                    id: timezoneHead
                                    text: "Change Timezone"
                                    leftPadding: 10
                                    topPadding: 3
                                    font.letterSpacing: 0.6
                                    color: "#475569"
                                    font.family: "Work Sans Medium"
                                }
                            }
                            ComboBox {
                                currentIndex: 0
                                anchors.top: changeTimeHead.bottom
                                model: ListModel {
                                    id: cbTimeItems
                                    ListElement { text: "Choose your Timezone"}
                                    ListElement { text: "India\tUTC+05:30 (IST)"}
                                    ListElement { text: "Afghanistan\tUTC+04:30"}
                                    ListElement { text: "Albania\tUTC+01:00 (CET)"}
                                    ListElement { text: "Los Angeles(USA)\tGMT-08:00 (PST)"}
                                }
                                width: parent.width
                                height: 44
                            }
                        }
                        Rectangle{
                            id: customTest
                            width: 213
                            height: 282
                            visible: false
                            Rectangle{
                                id: customHead
                                width: parent.width
                                height: 142
                                Grid{
                                    columns: 1
                                    rowSpacing: 14
                                    Text {
                                        id: createTest
                                        text: "Create a custom Test"
                                        leftPadding: 3
                                        topPadding: 3
                                        font.letterSpacing: 0.6
                                        color: "#334155"
                                        font.family: "Work Sans Medium"
                                    }
                                    InputBox{
                                        width: 212
                                        inputText: "Name the Test"
                                    }
                                    CustomButton{
                                        id: next
                                        width: 212
                                        height: 36
                                        text: "Next"
                                        labelFontSize: 14
                                        butRadius: 4
                                        onClicked: requestCustomTest()
                                    }
                                }
                            }
                            Rectangle{
                                id: availableTest
                                width: parent.width
                                height: 140
                                anchors.top: customHead.bottom
                                Text {
                                    id: availTest
                                    text: "Available Tests"
                                    leftPadding: 3
                                    bottomPadding: 14
                                    font.letterSpacing: 0.6
                                    color: "#334155"
                                    font.family: "Work Sans Medium"
                                }
                                Grid{
                                    columns: 1
                                    rowSpacing: 10
                                    anchors.top: availTest.bottom
                                    TestNameCustom{
                                        testText: "Custom Test 1"
                                    }
                                    TestNameCustom{
                                        testText: "Custom Test 2"
                                    }
                                    TestNameCustom{
                                        testText: "Custom Test 3"
                                    }
                                    TestNameCustom{
                                        testText: "Custom Test 4"
                                    }
                                }
                            }
                        }
                    }
                    states: [
                        State {
                            name: "wifiSettings"
                            PropertyChanges { target: wifi; visible: true }
                            PropertyChanges { target: update; visible: false }
                            PropertyChanges { target: language; visible: false }
                            PropertyChanges { target: timezone; visible: false }
                            PropertyChanges { target: customTest; visible: false }
                            PropertyChanges { target: item1; bodyColor: "#A7F3D0" }
                            PropertyChanges { target: item2; bodyColor: "transparent" }
                            PropertyChanges { target: item3; bodyColor: "transparent" }
                            PropertyChanges { target: item4; bodyColor: "transparent" }
                            PropertyChanges { target: item5; bodyColor: "transparent" }
                        },
                        State {
                            name: "updateSettings"
                            PropertyChanges { target: wifi; visible: false }
                            PropertyChanges { target: update; visible: true }
                            PropertyChanges { target: language; visible: false }
                            PropertyChanges { target: timezone; visible: false }
                            PropertyChanges { target: customTest; visible: false }
                            PropertyChanges { target: item1; bodyColor: "transparent" }
                            PropertyChanges { target: item2; bodyColor: "#A7F3D0" }
                            PropertyChanges { target: item3; bodyColor: "transparent" }
                            PropertyChanges { target: item4; bodyColor: "transparent" }
                            PropertyChanges { target: item5; bodyColor: "transparent" }
                        },
                        State {
                            name: "langSettings"
                            PropertyChanges { target: wifi; visible: false }
                            PropertyChanges { target: update; visible: false }
                            PropertyChanges { target: language; visible: true }
                            PropertyChanges { target: timezone; visible: false }
                            PropertyChanges { target: customTest; visible: false }
                            PropertyChanges { target: item1; bodyColor: "transparent" }
                            PropertyChanges { target: item2; bodyColor: "transparent" }
                            PropertyChanges { target: item3; bodyColor: "#A7F3D0" }
                            PropertyChanges { target: item4; bodyColor: "transparent" }
                            PropertyChanges { target: item5; bodyColor: "transparent" }
                        },
                        State {
                            name: "timeSettings"
                            PropertyChanges { target: wifi; visible: false }
                            PropertyChanges { target: update; visible: false }
                            PropertyChanges { target: language; visible: false }
                            PropertyChanges { target: timezone; visible: true }
                            PropertyChanges { target: customTest; visible: false }
                            PropertyChanges { target: item1; bodyColor: "transparent" }
                            PropertyChanges { target: item2; bodyColor: "transparent" }
                            PropertyChanges { target: item3; bodyColor: "transparent" }
                            PropertyChanges { target: item4; bodyColor: "#A7F3D0" }
                            PropertyChanges { target: item5; bodyColor: "transparent" }
                        },
                        State {
                            name: "customSettings"
                            PropertyChanges { target: wifi; visible: false }
                            PropertyChanges { target: update; visible: false }
                            PropertyChanges { target: language; visible: false }
                            PropertyChanges { target: timezone; visible: false }
                            PropertyChanges { target: customTest; visible: true }
                            PropertyChanges { target: item1; bodyColor: "transparent" }
                            PropertyChanges { target: item2; bodyColor: "transparent" }
                            PropertyChanges { target: item3; bodyColor: "transparent" }
                            PropertyChanges { target: item4; bodyColor: "transparent" }
                            PropertyChanges { target: item5; bodyColor: "#A7F3D0" }
                        }
                    ]
                }
            }
            Rectangle{
                id: editBox
                width: 247
                height: 191
                radius: 4
                visible: false
                Text {
                    id: title
                    text: "Enter new Name"
                    font.pixelSize: 16
                    font.family: "Work Sans Medium"
                }
            }
        }
    }
}
