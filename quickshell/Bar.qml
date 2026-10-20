import "Helpers"
import "Widgets"
import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Io

Scope {
    id: root
    
    Variants {
        model: Quickshell.screens

        PanelWindow {
            required property var modelData
            screen: modelData
            color: Colors.bgColor
            implicitHeight: 45
            
            anchors {
                top: true
                left: true
                right: true
            }

            RowLayout { 
                id: left
                anchors {
                    left: parent.left
                    leftMargin: 10
                    verticalCenter: parent.verticalCenter
                }

                spacing: 10

                Power {}
                Workspaces {}
                ActiveWindow {}
            }

            Clock {
                id: clock
                anchors.centerIn: parent
            }

            RowLayout {
                id: right
                anchors {
                    right: parent.right
                    rightMargin: 10
                    verticalCenter: parent.verticalCenter 
                }

                spacing: 10

                Media {}
                Network {}
                Battery {}
            }
        }
    }
}