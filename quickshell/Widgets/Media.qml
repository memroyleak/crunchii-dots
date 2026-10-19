import ".."
import "../Helpers"
import "../Monitors"
import QtQuick

Widget {
    visible: MediaMonitor.playing
    contents: MediaMonitor.track + " / " + MediaMonitor.artist
    icon: "\udb80\udf87"
}