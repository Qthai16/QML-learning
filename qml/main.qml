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

    Row {
        id: iButtonContainer
        spacing: 10

        CustomButton {
            id: iButton1
            width: 75; height: 75
            x: 10; y: 10
            text: "Button 1"
            buttonColor: "yellow"
        }

        CustomButton {
            id: iButton2
            width: 75; height: 75
            x: 10; y: 10
            text: "Button 2"
            buttonColor: "magenta"
        }

        CustomButton {
            id: iButton3
            width: 75; height: 75
            x: 10; y: 10
            text: "Button 3"
            buttonColor: "cyan"
        }
    }

    Row {
        spacing: 20
        y: 100

        Rectangle {
            id: iFirstNametext
            width: iFirstnameText.implicitWidth + 20; height: iFirstnameText.implicitHeight + 20
            color: "beige"

            Text {
                id: iFirstnameText
                text: "First name: "
                font.pointSize: 15
                anchors.centerIn: parent
            }
        }

        Rectangle {
            id: firstNameTextRectId
            color: "beige"
            width: firstNameInput.implicitWidth + 20; height: firstNameInput.implicitHeight + 20

            TextInput {
                id: firstNameInput
                anchors.centerIn: parent
                focus: true
                font.pointSize: 15
                text: "This is your firstname"
                onEditingFinished: {
                    console.log("lastname input: "+text)
                }
            }
        }
    }

    Flickable {
        x: 10; y: 175
        width: columnTextId.maxWidth
        contentHeight: columnTextId.implicitHeight
        height: textContent1.height
        ScrollBar.vertical: ScrollBar{
            width: 10
            policy: ScrollBar.AlwaysOn
            anchors.left: parent.right
            anchors.leftMargin: 8
        }

        Column {
            property int maxWidth: 300
            id: columnTextId
            spacing: 10
            anchors.fill : parent

            Rectangle {
                id: textContent1
                color: "beige"
                width: columnTextId.maxWidth + 20
                height: width

                TextEdit {
                    id: textInputId1
                    width: columnTextId.maxWidth
                    anchors.left: parent.left
                    anchors.leftMargin: 5
                    font.pointSize: 14
                    text: "<strong>Because</strong> we want to use our server locally, we set "+
                          "our domain name \r to be <font color = 'red' >localhost </font>. If we had set it up "+
                          " to\n be something  else, we would have to go mess with"+
                          " the host files to resolve whatever we put in here to"+
                          " a recognizable network address. "+
                          "ustleaveinlocalhostitisgoodenoughforourlocalusepurposes."+
                          " Leave the rest to defaults and hit continue. You are then"+
                          " given a choice for the database you want to use"
                    wrapMode: TextEdit.Wrap
                    textFormat: TextEdit.RichText
                    font.family: "Helvetica"
                    focus: true
                }
            }

            Rectangle {
                id: textContent2
                color: "white"
                width: columnTextId.maxWidth + 20
                height: width

                TextEdit {
                    id: textInputId2
                    width: columnTextId.maxWidth
                    anchors.left: parent.left
                    anchors.leftMargin: 5
                    font.pointSize: 14
                    text: "<strong>Because</strong> we want to use our server locally, we set "+
                          "our domain name \r to be <font color = 'red' >localhost </font>. If we had set it up "+
                          " to\n be something  else, we would have to go mess with"+
                          " the host files to resolve whatever we put in here to"+
                          " a recognizable network address. "+
                          "ustleaveinlocalhostitisgoodenoughforourlocalusepurposes."+
                          " Leave the rest to defaults and hit continue. You are then"+
                          " given a choice for the database you want to use"
                    wrapMode: TextEdit.Wrap
                    textFormat: TextEdit.RichText
                    font.family: "Helvetica"
                    focus: true
                }
            }
        }
    }

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
            //            onHoveredChanged: {
            //                if (containsMouse === true) {
            //                    smallRectId.color = "blue"
            //                }
            //                else {
            //                    smallRectId.color = "red"
            //                }
            //            }

            onClicked: {
                smallRectId1.x = mouse.x;
                smallRectId1.y = mouse.y;
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
