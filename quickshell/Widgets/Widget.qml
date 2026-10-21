import ".."
import "../Helpers"
import QtQuick
import QtQuick.Layouts
import Quickshell

Rectangle {
    id: root
    property alias contents: label.text
    default property alias extra: row.data

    implicitWidth: row.implicitWidth + 30
    implicitHeight: 30
    radius: height / 2
    color: Colors.widgetBgColor

    property string icon: ""

    signal clicked()

    MouseArea {
        anchors.fill: parent
        cursorShape: Qt.PointingHandCursor
        onClicked: root.clicked()
    }

    RowLayout {
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