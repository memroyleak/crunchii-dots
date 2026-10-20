import ".."
import "../Helpers"
import QtQuick
import Quickshell.Hyprland

Widget {
    readonly property var workspaces: Hyprland.workspaces.values
    readonly property int currentWorkspaceId: Hyprland.focusedWorkspace?.id ?? 0

    Repeater {
        model: Hyprland.workspaces

        Rectangle {
            id: ws

            required property var modelData
            required property int index
            readonly property int wsId: index + 1

            implicitWidth: 22
            implicitHeight: 20
            radius: height / 2
            color: modelData.focused ? Colors.accentColor : "transparent"

            Behavior on color {
                ColorAnimation { 
                    duration: 150
                }
            }

            CText {
                anchors.centerIn: parent
                text: wsId
                color: modelData.focused ? Colors.widgetBgColor : Colors.unfocusedColor 
            }

            MouseArea {
               anchors.fill: parent
               onClicked: modelData.activate()
            } 
        }
    }
}