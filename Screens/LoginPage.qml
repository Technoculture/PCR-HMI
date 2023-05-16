import QtQuick 2.15
import "../Assets"
import "../Components"
import QtGraphicalEffects 1.15

Item {
    id: root

    signal requestSettings()
    signal requestTray()
    signal goToNextPage()
    Rectangle{
        anchors.fill: parent
        color: "#A7F3D0"
        Rectangle{
            width: 347
            height: 392
            radius: 8
            anchors.centerIn: parent
            Grid{
                columns: 1
                rows: 4
                rowSpacing: 30
                anchors.centerIn: parent
                width: parent.width-60
                height: parent.height-60
                Rectangle{
                    width: parent.width
                    height: logo.height
                    Text {
                        id: welcome
                        text: "Welcome"
                        color: "#475569"
                        font.pixelSize: 14
                        topPadding: 5
                        bottomPadding: 5
                        font.family: "Work Sans Medium"
                    }
                    Text {
                        text: "Login to a proceed"
                        color: "#64748B"
                        font.pixelSize: 12
                        font.family: "Work Sans Medium"
                        anchors.top: welcome.bottom
                    }
                    Image {
                        id: logo
                        source: "../Assets/Tcr Logo.png"
                        anchors.right: parent.right
                    }
                }
                Rectangle{
                    width: 286
                    height: 124
                    Grid{
                        anchors.fill: parent
                        columns: 1
                        rows: 3
                        rowSpacing: 15
                        InputBox{
                            placehText: "Username"
                            onFocusChanged: showKeyboard(true)
                        }
                        InputBox{
                            id: pass
                            placehText: "Password"
                            typeOfInput: TextInput.Password
                        }
                        Text {
                            id: showPassword
                            text: "Show Password"
                            color: "#94A3B8"
                            padding: 3
                            font.family: "Work Sans Medium"
                            MouseArea{
                                id: showORhide
                                anchors.fill: showPassword
                                onClicked:
                                    if(pass.typeOfInput === TextInput.Password)
                                        pass.typeOfInput = TextInput.Normal
                                    else
                                        pass.typeOfInput = TextInput.Password
                            }
                        }
                    }
                }
                CustomButton{
                    id: loginButton
                    width: parent.width
                    height: 36
                    text: "Login"
                    labelFontSize: 14
                    butRadius: 4
                    onClicked: requestTray()
                }
                FuncButton{
                    id: settings
                    text: "Settings"
                    textColor: "#059669"
                    labelFontSize: 16
                    iconSource: "SettingsActive.png"
                    onClicked: requestSettings()
                }
            }
        }
    }
}
