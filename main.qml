import QtQuick 2.15
import QtQuick.Window 2.15
import QtGraphicalEffects 1.15
import "./Screens"
import "./Components"

Window {
    width: 800
    height: 480
    visible: true
    title: "PCR"
//    LoginPage{
//        id: login
//        anchors.centerIn: parent
//    }
    Settings_Wifi{
        anchors.fill: parent
    }
}
