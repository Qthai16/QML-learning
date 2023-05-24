import QtQuick 2.15
import QtQuick.Controls 2.15

ApplicationWindow {
    id: window;
    visible: true
    width: 640
    height: 480
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
        spacing: 20

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
    }
}
