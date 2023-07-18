import QtQuick 2.15
import QtQuick.Controls 1.4
import "../Components"

Item {
    id:root

    signal goBackWithTestName(var testNumber, var testname)
    signal requestPatientDetails(var slotNumber)

    property int testNumber: -1
    Rectangle{
        anchors.fill: parent
        color: "#A7F3D0"
        Rectangle{
            width: 588
            height: 351
            anchors.centerIn: parent
            radius: 8
            Grid{
                width: parent.width-60
                height: parent.height-60
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
                            onClicked: requestPatientDetails(testNumber)
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
                    ListView {
                        anchors {
                            fill: parent
                            topMargin: 2;
                        }
                        model: testsTable
                        delegate:  TestSelect{
                            width: parent.width
                            height: 39
                            testText: model.test_name
//                            bottomLine: false
                            onClicked: {
                                goBackWithTestName(testNumber,testText)
                            }
                        }
                        spacing: 8
                    }
                }
            }
        }
    }
}
