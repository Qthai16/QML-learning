import QtQuick 2.11
import QtQuick.Controls 2.5

Item {
    property alias listView: listViewId
    property int itemHeight: 30
    property int itemWidth: 200
    id: root
//    width: parent.width
//    height: parent.height
//    height: mModelId.count*itemHeight
//    width: itemWidth
    anchors.fill: parent

//    Component.onCompleted: {
//        console.log("component width: "+ root.width + ", height: " +root.height);
//        console.log("listview width: "+ listViewId.width + ", height: " +listViewId.height);
//    }

    ListView {
        id: listViewId
//        anchors.fill: parent
        height: mModelId.count*itemHeight
        width: itemWidth
        model: mModelId
        highlight: Rectangle {
            width: itemWidth
            color: "#027199"
            opacity: 0.5
            border.color: "#000000"
            border.width: 3
            radius: 5
            z: 5
        }
        delegate: delegateId
        clip: true
    }

    Component {
        id: delegateId
        Rectangle {
            id: rectId
            color: "#6bd3ff"
            width: itemWidth
            height: itemHeight
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

//    Connections {
//        id: parentConnection

//        function oncloseDemo() {
//            root.destroy()
//        }

//        target: root.parent
//    }
}
