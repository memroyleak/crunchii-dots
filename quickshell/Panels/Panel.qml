import "../Helpers"
import QtQuick
import Quickshell
import Quickshell.Hyprland

PopupWindow {
    id: root

    required property Item target
    property bool open: false
    property real contentWidth: 200
    property real contentHeight: 200
    readonly property int pad: 8

    default property alias content: frame.data

    anchor.window: target.QsWindow.window
    anchor.item: target
    anchor.edges: Edges.Bottom | Edges.Left
    anchor.gravity: Edges.Bottom | Edges.Right

    implicitWidth: contentWidth + pad * 2
    implicitHeight: contentHeight + pad * 2
    color: "transparent"

    visible: open || frame.opacity > 0

    HyprlandFocusGrab {
        windows: [root]
        active: root.open
        onCleared: root.open = false
    }

    Rectangle {
        id: frame
        x: root.pad
        y: root.pad
        width: root.contentWidth
        height: root.contentHeight
        radius: 16
        color: Colors.bgColor
        border.width: 1
        border.color: Colors.widgetBgColor

        transformOrigin: Item.TopLeft
        opacity: root.open ? 1 : 0
        scale: root.open ? 1 : 0.92

        Behavior on opacity { NumberAnimation { duration: 180; easing.type: Easing.OutCubic } }
        Behavior on scale { NumberAnimation { duration: 180; easing.type: Easing.OutCubic } }
    }
}