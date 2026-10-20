import ".."
import "../Monitors"
import QtQuick

Widget {
    readonly property list<real> strengthThresholds: [0.0, 0.25, 0.5, 0.75, 1.0]
    
    function pickIcon(): void {
        if (NetworkMonitor.networkStrength > 0.25 && NetworkMonitor.networkStrength < 0.49)
            icon = "\udb82\udd1f";
        else if (NetworkMonitor.networkStrength > 0.5 && NetworkMonitor.networkStrength < 0.74)
            icon = "\udb82\udd22";
        else if (NetworkMonitor.networkStrength > 0.75 && NetworkMonitor.networkStrength < 0.89)
            icon = "\udb82\udd25";
        else if (NetworkMonitor.networkStrength > 0.9)
            icon = "\udb82\udd28";

        if (NetworkMonitor.connected === false)
            icon = "\udb82\udd2d";
    }

    Component.onCompleted: pickIcon()

    Timer {
        interval: 5000
        running: true
        repeat: true
        onTriggered: pickIcon()
    }
}