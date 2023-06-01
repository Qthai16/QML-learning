import QtQuick 2.11

import QtQuick.Controls 2.14

//import "../data/images.js" as IMAGE
//import "../data/colors.js" as COLOR

CheckBox {
//    property string checkmark:          "qrc:/res/checkmark.png"
    property string checkmark:          "qrc:/res/icons8-checkbox-40.png"
    property string partial_checkmark: "qrc:/res/partial-checkmark.png"
    property string transparent: "transparent"
    property string blue: "#2672FB"
    property string grey_54: "#707EA4"
    property string white: "#ffffff"

    id: iCheckBox
    property string colorbackground: transparent
    width: 16
    height: 16

    indicator: Rectangle {
        width: parent.width
        height: parent.height
        anchors.centerIn: parent
        opacity: enabled ? 1 : 0.2
        color: iCheckBox.checkState !== Qt.Unchecked ? blue : iCheckBox.colorbackground
        border.color: !enabled ? grey_54 : (iCheckBox.checkState
                                                  !== Qt.Unchecked ? blue : white)
        Image {
            id: indicatorChecked
//            width: iCheckBox.width / 1.6
            width: iCheckBox.width
            height: indicatorChecked.width
            anchors.centerIn: parent
            visible: iCheckBox.checkState !== Qt.Unchecked
            source: {
                if (iCheckBox.checkState === Qt.PartiallyChecked) {
                    return partial_checkmark
                }
                return checkmark
            }
        }
    }
}
