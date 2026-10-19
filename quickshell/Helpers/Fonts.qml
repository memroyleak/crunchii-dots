pragma Singleton

import QtQuick
import Quickshell

Singleton {
    readonly property string main: sf.status === FontLoader.Ready ? sf.name : "sans-serif"
    readonly property string icon: nerd.status === FontLoader.Ready ? nerd.name : "Hack"

    FontLoader {
        id: sf
        source: Qt.resolvedUrl("../Fonts/SF-Pro.ttf")
    }

    FontLoader {
        id: nerd
        source: Qt.resolvedUrl("../Fonts/JetBrainsMonoNerd.ttf")
    }
}