import QtQuick 2.11
import QtQuick.Controls 2.5

Item {
    property alias listView: listViewId
    id: root

    ListView {
        id: listViewId
        anchors.fill: parent
        model: mModelId
        highlight: Rectangle {
            width: 200
            color: "#027199"
            opacity: 0.5
            border.color: "#000000"
            border.width: 3
            radius: 5
            z: 5
        }
        delegate: delegateId
    }

    Component {
        id: delegateId
        Rectangle {
            id: rectId
            color: "#6bd3ff"
            width: 200
            height: 30
            radius: 5
            border.color: "#000000"

            Text {
                anchors.top: parent.top
                anchors.topMargin: 5
                anchors.horizontalCenter: parent.horizontalCenter
                id: textId
                text: country + ": " + capital
                font.pointSize: 10
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    listViewId.currentIndex = index
                }
            }

        }
    }

    ListModel {
        id: mModelId
        ListElement {
            country: "Vietnam"; capital: "Ha Noi"
        }
        ListElement {
            country: "England"; capital: "London"
        }
        ListElement {
            country: "Germany"; capital: "Berlin"
        }
        ListElement {
            country: "Thailand"; capital: "Bangkok"
        }
        ListElement {
            country: "Philippines"; capital: "Manila"
        }
    }

}
