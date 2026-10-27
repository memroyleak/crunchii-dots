import ".."
import "../Monitors"
import "../Panels"
import QtQuick

Widget {
    id: root
    contents: MediaMonitor.playing ? MediaMonitor.track + " / " + MediaMonitor.artist : Media
    icon: "\udb80\udf87"

    onClicked: panel.open = !panel.open

    MediaPanel {
        id: panel
        target: root
    }
}