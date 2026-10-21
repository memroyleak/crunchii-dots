import ".."
import "../Helpers"
import QtQuick
import Quickshell

Panel {
    id: root

    contentWidth: col.implicitWidth + 24
    contentHeight: col.implicitHeight + 24

    readonly property var actions: [
        { icon: "\uf023", contents: "Lock", cmd: ["loginctl", "lock-session"] },
        { icon: "\uf08b", contents: "Log Out", cmd: ["hyprctl", "dispatch", "exit"] },
        { icon: "\uf186", contents: "Suspend", cmd: ["systemctl", "suspend"] },
        { icon: "\uf021", contents: "Reboot", cmd: ["systemctl", "reboot"] },
        { icon: "\uf011", contents: "Shut Down", cmd: ["systenctl", "poweroff"] }
    ]

    Column {
        id: col
        anchors.centerIn: parent
        spacing: 4

        Repeater {
            model: root.actions

            Rectangle {
                id: item
                required property var modelData

                implicitWidth: 150
                implicitHeight: 34
                radius: 10
                color: hover.hovered ? Colors.widgetBgColor : "transparent"
                Behavior on color { ColorAnimation { duration: 120 } }

                HoverHandler { id: hover }

                TapHandler {
                    onTapped: {
                        Quickshell.execDetached(item.modelData.cmd);
                        root.open = false;
                    }
                }

                Row {
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    anchors.leftMargin: 12
                    spacing: 10

                    IconText {
                        width: 22
                        horizontalAlignment: Text.AlignHCenter
                        text: item.modelData.icon
                        color: hover.hovered ? Colors.accentColor : Colors.unfocusedColor
                    }

                    CText {
                        anchors.verticalCenter: parent.verticalCenter
                        text: item.modelData.content
                    }
                }
            }
        }
    }
}