import QtQuick 2.15

Item {
    id: root
    implicitWidth: parent.width-20
    implicitHeight: 54

    property string wifiName: ""
    property bool wifiStatus: false

    Rectangle{
        id: listItem
        anchors.fill: parent
        anchors.horizontalCenter: parent.horizontalCenter
        SettingsItem{
            id: list
            width: 140
            height: 42
            headText: wifiName
            bodyText: !wifiStatus ? "Secured" : "Connected"
            iconSource: "signal_wifi_4_bar_lock 1"
        }
        CustomButton{
            id: connectbut
            width: 89
            height: 24
            text: !wifiStatus ? "Connect" : "Disconnect"
            labelFontSize: 12
            anchors.right: parent.right
            anchors.verticalCenter: list.verticalCenter
            butRadius: 4
            onClicked:
                if(connectbut.text==="Connect"){
                    wifiStatus=true
                }
                else{
                    wifiStatus=false
                }
        }
    }
}
