import QtQuick 2.11
import QtQuick.Controls 2.5

import "../core/json-list-model"

Item {
    property alias listView: listViewId
    property int itemHeight: 30
    property int itemWidth: 400
    signal closeDemo
    id: root
    width: listViewId.width
    height: listViewId.height
//    height: mModelId.count*itemHeight
//    width: itemWidth
//    anchors.fill: parent

//    Component.onCompleted: {
//        console.log("component width: "+ root.width + ", height: " +root.height);
//        console.log("listview width: "+ listViewId.width + ", height: " +listViewId.height);
//    }

    onItemHeightChanged: {
        console.log("item height changed: " + itemHeight)
    }

    ListView {
        id: listViewId
//        anchors.fill: parent
        height: mModelId.count*itemHeight
        width: itemWidth
//        model: mModelId
        model: mJsonModel.model
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
//                text: country + ": " + capital
                text: category + ": " + author + ": " + title + ": " + price
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

    JSONListModel {
        id: mJsonModel
        source: "{\"store\":{\"book\":[{\"category\":\"reference\",\"author\":\"Nigel Rees\",\"title\":\"Sayings of the Century\",\"price\":8.95},{\"category\":\"fiction\",\"author\":\"Evelyn Waugh\",\"title\":\"Sword of Honour\",\"price\":12.99},{\"category\":\"fiction\",\"author\":\"Herman Melville\",\"title\":\"Moby Dick\",\"isbn\":\"0-553-21311-3\",\"price\":8.99},{\"category\":\"fiction\",\"author\":\"J. R. R. Tolkien\",\"title\":\"The Lord of the Rings\",\"isbn\":\"0-395-19395-8\",\"price\":22.99}],\"bicycle\":{\"color\":\"red\",\"price\":19.95}}}"
        query: "$.store.book[*]"
//        query: "$.store.bicycle[*]"
//        onSourceChanged: {

//        }
    }

    Connections {
        id: destroyConnection

        function onCloseDemo() {
            root.destroy()
        }

//        target: root.parent
        target: root
    }
}
