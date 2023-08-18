import QtQuick 2.11
import Qt.labs.platform 1.1

Item {
    id: trayContainerId
    property bool shouldVisible
    property string iconSource

    SystemTrayIcon {
        id: trayIconid
        visible: trayContainerId.shouldVisible
//        icon.source: "qrc:/res/OPSWAT.ico"
        icon.source: trayContainerId.iconSource
        onActivated: {
            window.show()
            window.raise()
            window.requestActivate()
        }

        menu: Menu {
            MenuItem {
                text: qsTr("Quit")
                onTriggered: Qt.quit()
            }
            MenuItem {
                text: qsTr("About")
                onTriggered: function(){
//                    console.log("About is selected")
                    showMessage("Important Notification", "Something important came up. Click this to know more.")
                }
            }
        }
    }
}
