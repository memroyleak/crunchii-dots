pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Services.Mpris

Singleton {
    id: root

    property bool hasPlayer: player !== null 
    property string track: player?.trackTitle ?? ""
    property string album: player?.trackAlbum ?? ""
    property string artist: player?.trackArtist ?? ""
    property string coverUrl: player?.trackArtUrl ?? ""
    property bool playing: player?.isPlaying ?? false

    readonly property list<MprisPlayer> list: Mpris.players.values
    readonly property MprisPlayer player: list.find(p => p.isPlaying) ?? list[0] ?? null
}