import QtQuick 2.11
import QtQuick.Controls 2.5
import QtQuick.Window 2.3
//import QtQml 2.12
//import QtQuick.Controls 2.11

ApplicationWindow {
    id: window;
    visible: true
    width: 640
    height: 480
    color: "#c5c7c9"
    title: qsTr("QTQuick Introduction")

    Shortcut {
        sequence: "F5"
        onActivated: {
            window.close()
            app.loadQml()
        }
    }

    function onClickCreateListView() {
        var lViewComponent = Qt.createComponent("qrc:/qml/SampleListView.qml");
        if (lViewComponent.status === Component.Ready) {
            var lViewObj = lViewComponent.createObject(iRectContainer, {
                                                      "parent": iRectContainer
                                                  });
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
//                console.log("list view")
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
            displayText: "Flickable"
            buttonColor: "cyan"
            handleClicked: function() {
                console.log("flickable")
            }
        }
    }

    Rectangle {
//        property var lView
        id: iRectContainer
        color: "#ffffff"
        width: sampleViewId.implicitWidth + 50
        height: sampleViewId.implicitHeight + 50
        radius: 5
        anchors {
            left: iButtonContainer.left
            top: iButtonContainer.bottom
            topMargin: 20
        }

        SampleListView {
            id: sampleViewId
            height: listView.contentHeight
            anchors.centerIn: parent.centerIn
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
