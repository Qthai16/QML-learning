import QtQuick 2.11

Item {
    id: root
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
                    text: "<h2 id='functionality'><a href='https://docs.opswat.com/macloud-sdp/kb/what-is-the-opswat-client-#functionality' heading-link='true'>Functionality</a></h2><p>The OPSWAT Client is a lightweight, unobtrusive application, designed to run on every device that is being managed by your account on either MetaAccess or OPSWAT Central Management.</p><p>OPSWAT Client delivers the device’s security status to the OPSWAT servers and, in turn, channels commands from the servers back to the device to resolve any issues.</p>"
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

}
