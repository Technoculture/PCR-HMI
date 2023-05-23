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
    Loader {
        id: screenLoader
        anchors.fill: parent
        source: "Screens/LoginPage.qml"
    }
    Connections {
        target: screenLoader.item
        ignoreUnknownSignals: true
        function onRequestBack() {
            screenLoader.source = "Screens/LoginPage.qml"
        }
        function onRequestSettings() {
            screenLoader.source = "Screens/Settings.qml"
        }
        function onRequestTray() {
            screenLoader.source = "Screens/OpenTray.qml"
        }
        function onRequestPatientDetails(){
            screenLoader.source = "Screens/PatientDetails.qml"
        }
        function onRequestPresetTest(){
            screenLoader.source = "Screens/PresetTest.qml"
        }
        function onRequestCustomTest(){
            screenLoader.source = "Screens/CustomTest.qml"
        }
        function onRequestSlots() {
            screenLoader.source = "Screens/SlotsInfo.qml"
        }
        function onRequestResults() {
            screenLoader.source = "Screens/Results.qml"
        }
}
    Loader {
        id: panelIO
        width: parent.width
        height: parent.height
        source: "./Components/Keyboard.qml"
    }
}
