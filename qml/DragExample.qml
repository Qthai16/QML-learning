import QtQuick 2.11

Item {
    id: root
    Rectangle {
        property string rectColor: "beige"
        id: rectId
        width: 200; height: 200
        color: rectColor
        x: 400; y: 10

        Column {
            id: rectWrapperId
            spacing: 10

            Rectangle {
                id: smallRectId1
                width: textInputNewId1.implicitWidth+30; height: textInputNewId1.implicitHeight+30
                color: "#00ff3f"
                border.color: "#000000"

                TextInput {
                    id: textInputNewId1
                    anchors.fill: parent
                    text: "Input your name"
                    focus: true
                    font.pointSize: 12
                }
            }

            Rectangle {
                id: smallRectId2
                width: textInputNewId2.implicitWidth+30; height: textInputNewId2.implicitHeight+30
                color: "#8e1fff"
                border.color: "#000000"

                TextInput {
                    id: textInputNewId2
                    anchors.fill: parent
                    text: "Input your email"
                    focus: true
                    font.pointSize: 12
                    color: "#ffffff"
                }
            }

        }


        MouseArea {
            anchors.fill: parent
            hoverEnabled: true
            onHoveredChanged: {
                if (containsMouse === true) {
                    smallRectId.color = "blue"
                }
                else {
                    smallRectId.color = "red"
                }
            }

            drag {
                target: rectWrapperId
                axis: Drag.XAndYAxis
                minimumX: 0
                minimumY: 0
                maximumX: rectId.width - smallRectId1.width
                maximumY: rectId.height - smallRectId1.height
            }
        }
    }

}
