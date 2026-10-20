import Quickshell.Hyprland

Widget {
    readonly property string activeWindow: {
        const title = Hyprland.activeToplevel?.title;

        if (!title)
            return "Desktop";

        return title;
    }

    contents: activeWindow
}