pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Services.UPower

Singleton {
    id: root

    readonly property list<var> warnLevels: [20, 10]
    readonly property var device: UPower.displayDevice

    readonly property real percentage: device.ready ? device.percentage * 100 : 0

    property real lastPercentage: 0

    function update(): void {
        if (device.ready)
            lastPercentage = device.percentage * 100;
    }

    Component.onCompleted: update()

    Connections {
        function onReadyChanged(): void {
            root.update();
        }

        function onPercentageChanged(): void {
            root.update();
        }

        target: root.device
    }
}