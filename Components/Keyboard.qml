import QtQuick 2.15

Item {
    id: root
    readonly property var numKeysRow0: ['1', '2', '3']
    readonly property var numKeysRow1: ['4', '5', '6']
    readonly property var numKeysRow2: ['7', '8', '9']
    readonly property var numKeysRow3: ['0','½','¼']
    readonly property var keysRow1: ['q', 'w', 'e', 'r', 't', 'y', 'u', 'i', 'o', 'p']
    readonly property var keysRow2: ['a', 's', 'd', 'f', 'g', 'h', 'j', 'k', 'l']
    readonly property var keysRow3: ['z', 'x', 'c', 'v', 'b', 'n', 'm']
    property bool shift: false
    signal keyPressed(var key)
    signal backspacePressed()
    signal hidePressed()
    property int keyHeight: 36
    property int keyWidth: 40
    height: parent.height * 0.5
    width: parent.width
    z: 100
    Rectangle {
        anchors.fill: parent
        color: "#334155"
        Grid{
            columns: 4
            anchors.fill: parent
            columnSpacing: 18
            padding: 20
            Column {
                id: keys
                property var rows: [keysRow1, keysRow2, keysRow3]
                spacing: 7
                Repeater {
                    model: parent.rows
                    Row {
                        anchors.horizontalCenter: parent.horizontalCenter
                        spacing: 9
                        Repeater {
                            model: modelData
                            CustomButton {
                                height: keyHeight
                                width: keyWidth
                                bgColor: "#64748B"
                                butRadius: 4
                                labelFontSize: 14
                                text: shift ? String(modelData).toUpperCase() : modelData
                                onClicked: checkKeyPress(modelData)
                            }
                        }
                    }
                }
                Row {
                    anchors.horizontalCenter: parent.horizontalCenter
                    spacing: 7
                    CustomButton {
                        height: keyHeight
                        width: keyWidth
                        bgColor: "#64748B"
                        butRadius: 4
                        labelFontSize: 14
                        text: shift ? "⬆" : "⇧"
                        onClicked: shift = !shift
                    }
                    CustomButton {
                        height: keyHeight
                        width: keyWidth * (keysRow3.length - 3)
                        bgColor: "#64748B"
                        butRadius: 4
                        labelFontSize: 14
                        text: "Space"
                        onClicked: checkKeyPress(" ")
                    }
                    CustomButton {
                        height: keyHeight
                        width: keyWidth
                        bgColor: "#64748B"
                        butRadius: 4
                        labelFontSize: 14
                        text: "⌫"
                        onClicked: checkKeyPress("⌫")
                    }
                    CustomButton {
                        height: keyHeight
                        width: keyWidth
                        bgColor: "#64748B"
                        butRadius: 4
                        labelFontSize: 14
                        text: "⌨"
                        onClicked: checkKeyPress("⌨")
                    }
                }
            }
            Column {
                id: numpad
                property var rows: [numKeysRow0,numKeysRow1,numKeysRow2,numKeysRow3]
                spacing: 7
                Repeater {
                    model: parent.rows
                    Row {
                        anchors.horizontalCenter: parent.horizontalCenter
                        spacing: 9
                        Repeater {
                            model: modelData
                            CustomButton {
                                height: keyHeight
                                width: keyWidth
                                bgColor: "#64748B"
                                butRadius: 4
                                labelFontSize: 14
                                text: shift ? String(modelData).toUpperCase() : modelData
                                onClicked: checkKeyPress(modelData)
                            }
                        }
                    }
                }
            }
            Column {
                id: titles
                spacing: 7
                CustomButton {
                    height: keyHeight
                    width: keyWidth+8
                    bgColor: "#64748B"
                    butRadius: 4
                    labelFontSize: 14
                    text: "Mr."
                    onClicked: checkKeyPress("Mr.")
                }
                CustomButton {
                    height: keyHeight
                    width: keyWidth+8
                    bgColor: "#64748B"
                    butRadius: 4
                    labelFontSize: 14
                    text: "Mrs."
                    onClicked: checkKeyPress("Mrs.")
                }
                CustomButton {
                    height: keyHeight
                    width: keyWidth+8
                    bgColor: "#64748B"
                    butRadius: 4
                    labelFontSize: 14
                    text: "Ms."
                    onClicked: checkKeyPress("Ms.")
                }
                CustomButton {
                    height: keyHeight
                    width: keyWidth+8
                    bgColor: "#64748B"
                    butRadius: 4
                    labelFontSize: 14
                    text: "Dr."
                    onClicked: checkKeyPress("Dr.")
                }
            }
            Column {
                id: deleteEnter
                spacing: 7
                CustomButton {
                    height: keyHeight*2+7
                    width: keyWidth+5
                    bgColor: "#64748B"
                    butRadius: 4
                    labelFontSize: 14
                    text: "Delete"
                    onClicked: checkKeyPress("delete")
                }
                CustomButton {
                    height: keyHeight*2+7
                    width: keyWidth+5
                    bgColor: "#64748B"
                    butRadius: 4
                    labelFontSize: 40
                    text: "↵"
                    onClicked: checkKeyPress("Mrs.")
                }
            }
        }
    }
    function checkKeyPress(key) {
        if (key === "⌫")
            backspacePressed()
        else if (key === "⌨")
            visible = false
        else if (key === "↵")
            visible = false
        else
            keyPressed(shift ? String(key).toUpperCase() : key)
        shift = false
    }
}
