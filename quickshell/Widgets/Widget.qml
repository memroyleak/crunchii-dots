import ".."
import "../Helpers"
import QtQuick
import Quickshell

Rectangle {
    id: root
    property alias contents: label.text
    default property alias extra: row.data

    implicitWidth: row.implicitWidth + 30
    implicitHeight: 30
    anchors.verticalCenter: parent.verticalCenter
    radius: height / 2
    color: Colors.widgetBgColor

    property string icon: ""

    Row {
        id: row
        anchors.centerIn: parent
        spacing: 10

        CText {
            id: label
            visible: text !== ""
        }

        IconText {
            id: iconElement
            visible: icon !== ""
            text: icon
        }
    }
}