import QtQuick 2.15

Item {
    id: root
    implicitHeight: 39
    property alias dataContent: data.text
    property alias dataValueContent: dataValue.text
    property int topPaddingExtra: 10
    Rectangle{
        id: dataRec
        width: 111
        height: 39
        Text {
            id: data
            text: "Referred by"
            padding: 10
            topPadding: topPaddingExtra
            font.pixelSize: 16
            font.letterSpacing: 0.5
            font.family: "Work Sans"
            color: "#475569"
        }
    }
    Rectangle{
        id: dataValueRec
        width: 181
        height: 39
        anchors.right: parent.right
        Text {
            id: dataValue
            text: "Dr. Anil Sumar"
            padding: 10
            topPadding: topPaddingExtra
            font.pixelSize: 16
            font.family: "Work Sans Medium"
            color: "#475569"
        }
    }
}
