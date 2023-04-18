import QtQuick 2.15

Item {
    id: root
    implicitHeight: 29
    property alias dataContent: data.text
    property alias dataValueContent: dataValue.text
    property int fontSize: 16
    property int topPaddingExtra: 10
    Rectangle{
        id: dataRec
        width: 111
        height: parent.height
        color: "transparent"
        Text {
            id: data
            text: "Referred by"
            padding: 10
            topPadding: topPaddingExtra
            font.pixelSize: fontSize
            font.letterSpacing: 0.5
            font.family: "Work Sans"
            color: "#475569"
        }
    }
    Rectangle{
        id: dataValueRec
        width: 181
        height: parent.height
        anchors.right: parent.right
        color: "transparent"
        Text {
            id: dataValue
            text: "Dr. Anil Sumar"
            padding: 10
            topPadding: topPaddingExtra
            font.pixelSize: fontSize
            font.family: "Work Sans Medium"
            color: "#475569"
        }
    }
}
