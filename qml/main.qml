import QtQuick 2.11
import QtQuick.Controls 2.5
import QtQuick.Window 2.3
import QtQuick.Layouts 1.3

import "../data/constant.js" as STR
//import QtQml 2.12
//import QtQuick.Controls 2.11

ApplicationWindow {
    id: window;
    visible: true
    width: 640
    height: 480
    color: "#c5c7c9"
    title: qsTr("QTQuick Introduction")

    property var currentDemos: []

    Shortcut {
        sequence: "F5"
        onActivated: {
            window.close()
            app.loadQml()
        }
    }

    function onClickCreateListView() {
//        var lViewComponent = Qt.createComponent("qrc:/qml/SampleListView.qml");
//        console.log("path: "+STR.SAMPLE_LISTVIEW_FILE.arg(app.qmlPath()));
        var lViewComponent = Qt.createComponent(STR.SAMPLE_LISTVIEW_FILE.arg(app.qmlPath()));
        if (lViewComponent.status === Component.Ready) {
            let demoInstance = lViewComponent.createObject(igridShow, {
                                                      "parent": igridShow,
                                                  });
            window.currentDemos.push(demoInstance);
        }

    }

    Row {
        id: iButtonContainer

        spacing: 10
        anchors {
            left: parent.left
            top: parent.top
            margins: 10
        }

        CustomButton {
            id: iButton1
            displayText: "List View"
            buttonColor: "yellow"
            handleClicked: function() {
                onClickCreateListView()
            }
        }

        CustomButton {
            id: iButton2
            displayText: "Drag"
            buttonColor: "magenta"
            handleClicked: function() {
                console.log("drag")
            }
        }

        CustomButton {
            id: iButton3
            displayText: "Flickable content"
            buttonColor: "cyan"
            handleClicked: function() {
//                console.log("flickable")
            }
        }
    }

    CustomButton {
        id: iButton4
        displayText: "Remove demo"
        buttonColor: "dodgerblue"
        anchors {
            top: parent.top
            right: parent.right
            topMargin: 10
            rightMargin: 20
        }

        handleClicked: function() {
//            igridShow.closeDemo()
            for (const element of currentDemos) {
                element.closeDemo()
            }
            window.currentDemos = []
//            window.currentDemos.forEach(function(element){element.closeDemo()})
        }
    }

    Item {
        id: iShowRect
        anchors {
            fill: parent
//            right: parent.right
//            left : iButtonContainer.left
//            top: iButtonContainer.bottom
//            bottom: parent.bottom
            topMargin: 55
            leftMargin: 10
            rightMargin: 10
            bottomMargin: 10
        }

        Rectangle {
            id: iRectContainer
            color: "#ffffff"
            radius: 5
            anchors.fill: parent

            GridLayout {
                id: igridShow
                signal closeDemo

                columnSpacing: 10
                rowSpacing: 10
                columns: 2
            }
        }
    }

    //    CustomCheckBox {
    //        id: checkBox1
    //        width: 50
    //        height: width
    //        anchors {
    //            right: parent.right
    //            bottom: parent.bottom
    //        }
    //        checkState: Qt.Unchecked
    //    }
}
