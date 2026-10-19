import "../Helpers"
import "../Monitors"
import ".."
import QtQuick
import Quickshell

Widget {
    contents: Math.round(BatteryMonitor.percentage) + "%"
    icon: "\uf240"
}