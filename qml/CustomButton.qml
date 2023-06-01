import QtQuick 2.11

Item {
    id: iRoot
    width: iRect.width
    height: iRect.height
    property alias buttonColor: iRect.color
    property string displayText: ""
    property int minWidth: 60
    property int minHeight: 30
    property var handleClicked: function() {}

    Rectangle {
        id: iRect;
        anchors.fill: parent
        width: iText.implicitWidth + 20 < minWidth ? minWidth : iText.implicitWidth + 20
        height: iText.implicitHeight + 20 < minHeight ? minHeight : iText.implicitHeight + 20
        color: "red"
        radius: 5

        Text {
            id: iText
            text: displayText
            color: "#000000"
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            font.pointSize: 10
        }

        MouseArea {
            anchors.fill: parent
            onClicked: handleClicked()
        }
    }
}
