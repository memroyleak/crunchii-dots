import ".."
import "../Panels"
import QtQuick
import Quickshell

Widget {
    id: root
    icon: "\uf30a"

    onClicked: panel.open = !panel.open

    PowerPanel {
        id: panel
        target: root
    }
}