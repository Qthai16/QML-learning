import QtQuick 2.11

Item {
    id: iRoot
    width: iRect.width
    height: iRect.height
    property alias buttonColor: iRect.color
    property alias text: iText.displayText

    Rectangle {
        id: iRect;
        anchors.fill: parent
        x: iRoot.x; y: iRoot.y;
        width: 50; height: 50
        color: "red"
        radius: 20
    }

    Text {
        property string displayText: ""
        id: iText
        text: iText.displayText
        color: "#000000"
        anchors.centerIn: parent
        font.pointSize: 10
    }

    MouseArea {
        anchors.fill: parent
        onClicked: {
            console.log("button is clicked")
        }
    }
}
