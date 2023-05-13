import QtQuick 2.15
import QtQuick.Controls 1.4
import "../Components"

Item {
    id:root
    Rectangle{
        anchors.fill: parent
        color: "#A7F3D0"
        Rectangle{
            id: main
            width: 539
            height: 437
            anchors.centerIn: parent
            radius: 8
            Grid{
                width: parent.width-60
                height: parent.height-60
                anchors.centerIn: parent
                rows: 3
                rowSpacing: 15
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
                            onClicked: {
                                trayOpening.visible=false
                                login.visible=true
                            }
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
                    width: parent.width
                    height: illustrate.height
                    Image {
                        id: illustrate
                        source: "../Assets/Open Tray.png"
                        anchors.centerIn: parent
                    }
                }
                Rectangle{
                    width: parent.width
                    height: tray.height
                    CustomButton{
                        id: tray
                        width: 98
                        height: 34
                        text: "Open Tray"
                        labelFontSize: 12
                        butRadius: 4
                        anchors.centerIn: parent
                        onClicked: if(main.state=="") main.state="Close"
                        else main.state=""
                    }
                }
            }
            states: [
                State {
                    name: "Close"
                    PropertyChanges {
                        target: illustrate
                        source: "../Assets/Close Tray.png"
                    }
                    PropertyChanges {
                        target: tray
                        text: "Close Tray"
                    }
                }
            ]
        }
    }
}
