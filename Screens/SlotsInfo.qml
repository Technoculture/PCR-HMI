import QtQuick 2.15
import QtQuick.Controls 1.4
import "../Components"

Item {
    id:root
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
                rowSpacing: 28
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
                            text: "Preset Test"
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
                    height: 223
                    Grid{
                        id: preTest
                        width: parent.width
                        height: parent.height
                        columns: 1
                        rowSpacing: 8
                        TestSelect{
                            width: parent.width
                            height: 39
                            testText: "Malaria PF"
                        }
                        TestSelect{
                            width: parent.width
                            height: 39
                            testText: "OpticsLong"
                        }
                        TestSelect{
                            width: parent.width
                            height: 39
                            testText: "Malaria PVPF"
                        }
                        TestSelect{
                            width: parent.width
                            height: 39
                            testText: "MTB"
                        }
                        TestSelect{
                            width: parent.width
                            height: 39
                            testText: "MTB Plus"
                            bottomLine: false
                        }
                    }
                }
            }
        }
    }
}
