import QtQuick 2.15
import "../Assets"
import "../Components"
import QtGraphicalEffects 1.15

Item {
    id: root
    implicitHeight: 324
    implicitWidth: 347
    Rectangle{
        anchors.fill: parent
        radius: 8
        Grid{
            columns: 1
            rows: 3
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
                }
                Text {
                    text: "Login to a proceed"
                    color: "#64748B"
                    font.pixelSize: 12
                    anchors.top: welcome.bottom
                }
                Image {
                    id: logo
                    source: "../Assets/Tcr Logo.png"
                    anchors.right: parent.right
                }
            }
            InputBox{
                x:10;y:15
                placeholderText: "Username"
            }
//            Rectangle{
//                id: loginCredentials
//                Grid{
//                    columns: 1
//                    rows: 5
//                    rowSpacing: 6
//                    Text {
//                        text: "Enter Username"
//                        font.pixelSize: 16
//                        color: "black"
//                    }
//                    Rectangle{
//                        id: userInput
//                        width: 300
//                        height: 44
//                        radius: 10
//                        border{
//                            color: "#888888"
//                            width: 1
//                        }
//                    }
//                    Text {
//                        text: "Random text"
//                        font.pixelSize: 12
//                        color: "black"
//                        bottomPadding: 20
//                    }
//                    Text {
//                        text: "Enter Password"
//                        font.pixelSize: 16
//                        color: "black"
//                    }
//                    Rectangle{
//                        id: passInput
//                        width: 300
//                        height: 44
//                        radius: 10
//                        border{
//                            color: "#888888"
//                            width: 1
//                        }
//                    }
//                }
//            }
        }
    }
    layer.enabled: true
    layer.effect: DropShadow{
        transparentBorder: true
        color: "#636363"
        radius: 10
        samples: 21
        opacity: 0.2
    }
}
