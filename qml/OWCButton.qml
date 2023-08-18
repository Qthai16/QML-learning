import "../data/colors.js" as COLOR
import QtQuick 2.11

Rectangle {
    id: recButton

    property string buttonText
    property var handleClicked: function() {
    }
    property var checkDisabled: function() {
        return false;
    }
    property int fontSize: 14
    property alias text: txtStrButton

    width: 136
    height: 35
    color: COLOR.BLUE
    opacity: 1
    state: checkDisabled() ? "disabled" : (maButton.containsMouse ? "hovered" : "enabled")
    states: [
        State {
            name: "disabled"

            PropertyChanges {
                target: recButton
                opacity: 0.6
            }

            PropertyChanges {
                target: txtStrButton
                color: COLOR.WHITE_BLUE_86
            }

            PropertyChanges {
                target: recButton
                color: COLOR.BLUE
            }

        },
        State {
            name: "enabled"

            PropertyChanges {
                target: recButton
                opacity: 1
            }

            PropertyChanges {
                target: txtStrButton
                color: COLOR.WHITE
            }

            PropertyChanges {
                target: recButton
                color: COLOR.BLUE
            }

        },
        State {
            name: "hovered"

            PropertyChanges {
                target: recButton
                opacity: 1
            }

            PropertyChanges {
                target: txtStrButton
                color: COLOR.WHITE
            }

            PropertyChanges {
                target: recButton
                color: COLOR.BLUE_DARKER
            }

        }
    ]

    Text {
        id: txtStrButton

        text: buttonText
        anchors.fill: parent
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        elide: Text.ElideRight
        color: COLOR.WHITE

        font {
            pixelSize: recButton.fontSize
            family: fontSimplonNormMedium.name
        }

    }

    MouseArea {
        id: maButton

        anchors.fill: parent
        hoverEnabled: enabled
        enabled: recButton.state != "disabled"
        cursorShape: enabled ? Qt.PointingHandCursor : Qt.ArrowCursor
        onClicked: handleClicked()
    }

}
