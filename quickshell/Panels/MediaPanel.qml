import ".."
import "../Monitors"
import QtQuick
import Quickshell

Panel {
    contentWidth: 500
    contentHeight: 250

    Row {
        id: col
        anchors.verticalCenter: parent.verticalCenter
        spacing: 25
        leftPadding: 25

        Rectangle {
            id: cover
            width: 200
            height: 200

            Image {
                anchors.fill: parent
                id: coverImage
                source: MediaMonitor.coverUrl
            }
        }

        Column {
            id: mediaInfo
            spacing: 8

            CText {
                text: MediaMonitor.track
                font.bold: true
                font.pixelSize: 25
            }

            CText {
                text: MediaMonitor.artist
                font.pixelSize: 18
            }

            CText {
                text: MediaMonitor.album
                font.pixelSize: 18
            }
        }
    }
}