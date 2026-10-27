import "../Helpers"
import QtQuick
import QtQuick.Shapes
import Quickshell
import Quickshell.Hyprland

PopupWindow {
    id: root

    required property Item target
    property bool open: false
    property real contentWidth: 200
    property real contentHeight: 200

    default property alias content: frame.data

    readonly property var bar: target.QsWindow.window
    readonly property int r: 16

    anchor.window: bar
    anchor.edges: Edges.Bottom | Edges.Left
    anchor.gravity: Edges.Bottom | Edges.Right

    anchor.onAnchoring: {
        const p = bar.contentItem.mapFromItem(target, 0, 0);
        anchor.rect.x = p.x - r;
        anchor.rect.y = bar.height;
        anchor.rect.width = target.width
        anchor.rect.height = 0;
    }

    implicitWidth: contentWidth + r * 2
    implicitHeight: contentHeight
    color: "transparent"

    visible: open || slider.y > -slider.height

    HyprlandFocusGrab {
        windows: [root]
        active: root.open
        onCleared: root.open = false
    }

    Item {
        id: slider
        width: root.width
        height: root.contentHeight
        y: root.open ? 0 : -height

        Behavior on y {
           NumberAnimation { duration: 300; easing.type: Easing.OutExpo }
        }

        Rectangle {
            id: frame
            x: root.r
            width: root.contentWidth
            height: root.contentHeight
            color: Colors.bgColor

            topLeftRadius: 0
            topRightRadius: 0
            bottomLeftRadius: 16
            bottomRightRadius: 16
        }

        Shape {
            x: 0
            y: 0
            width: root.r
            height: root.r
            preferredRendererType: Shape.CurveRenderer

            ShapePath {
                fillColor: Colors.bgColor
                strokeColor: "transparent"

                startX: 0; startY: 0;
                PathLine { x: root.r; y: 0 }
                PathLine { x: root.r; y: root.r }
                PathArc {
                    x: 0; y: 0
                    radiusX: root.r; radiusY: root.r
                    direction: PathArc.Counterclockwise
                }
            }
        }

        Shape {
            x: root.contentWidth + root.r
            y: 0
            width: root.r
            height: root.r
            preferredRendererType: Shape.CurveRenderer

            ShapePath {
                fillColor: Colors.bgColor
                strokeColor: "transparent"

                startX: 0; startY: 0
                PathLine { x: root.r; y: 0 }
                PathArc {
                    x: 0; y: root.r
                    radiusX: root.r; radiusY: root.r
                    direction: PathArc.Counterclockwise
                }
                PathLine { x: 0; y: 0 }
            }
        }
    }
}