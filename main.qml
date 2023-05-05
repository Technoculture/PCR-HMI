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
    Keyboard{
        id: keyBoard
    }

    LoginPage{
        id: login
        anchors.fill: parent
        visible: false
    }
    Settings{
        id: settingsPage
        visible: false
        anchors.fill: parent
    }
//    Results{
//        anchors.fill: parent
//    }
//    PatientDetails{
//        anchors.fill: parent
//    }
//    PresetTest{
//        anchors.fill: parent
//    }
//    SlotsInfo{
//        anchors.fill: parent
//    }
//    OpenTray{
//        id: trayOpening
//        anchors.fill: parent
//    }
    CustomTest{
        id: customTest
        anchors.fill: parent
        visible: false
    }
}
