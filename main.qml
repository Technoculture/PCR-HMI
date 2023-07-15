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
        function onRequestPatientDetails(slotNumber){
            screenLoader.source = "Screens/PatientDetails.qml"
            screenLoader.item.number=slotNumber;
        }
        function onRequestPresetTest(slotNumber){
            screenLoader.source = "Screens/PresetTest.qml"
            screenLoader.item.testNumber=slotNumber;
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
        function onGoBackWithTestName(slotNumber,name){
            screenLoader.source = "Screens/PatientDetails.qml"
            if(slotNumber===1){
                screenLoader.item.testName1=name
                screenLoader.item.number=1
                screenLoader.item.currentState="1"
            }else if(slotNumber===2){
                screenLoader.item.testName2=name
                screenLoader.item.number=2
                screenLoader.item.currentState="2"
            }else if(slotNumber===3){
                screenLoader.item.testName3=name
                screenLoader.item.number=3
                screenLoader.item.currentState="3"
            }else if(slotNumber===4){
                screenLoader.item.testName4=name
                screenLoader.item.number=4
                screenLoader.item.currentState="4"
            }
        }
}
    Loader {
        id: panelIO
        width: parent.width
        height: parent.height
        source: "./Components/Keyboard.qml"
        visible: false
    }
}
