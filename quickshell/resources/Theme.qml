pragma Singleton
import Quickshell
import QtQuick
import Quickshell.Io

FileView {
    id: root
    path: Quickshell.shellPath("resources/colors.json")
    watchChanges: true
    onFileChanged: reload()

    readonly property bool lightMode: Options.colorMode === ColorPref.Light

    property string background: lightMode ? colors.light_background : colors.normal_background
    property string background_alt: lightMode ? colors.light_background_alt : colors.normal_background_alt
    property string background_hover: lightMode ? colors.light_background_hover : colors.normal_background_hover
    property string rose: lightMode ? colors.light_rose : colors.normal_rose
    property string rose_dim: lightMode ? colors.light_rose_dim : colors.normal_rose_dim
    property string foreground: lightMode ? colors.light_foreground : colors.normal_foreground
    property string foreground_muted: lightMode ? colors.light_foreground_muted : colors.normal_foreground_muted
    property string border: lightMode ? colors.light_border : colors.normal_border
    property alias shadow: colors.shadow
    property string element_alt: lightMode ? colors.light_element_alt : colors.normal_element_alt
    property string urgent: lightMode ? colors.light_urgent : colors.normal_urgent

    property string surface: lightMode ? colors.light_surface : colors.normal_surface
    property string on_surface: lightMode ? colors.light_on_surface : colors.normal_on_surface
    property string workspace_surface: lightMode ? colors.light_workspace_surface : colors.normal_workspace_surface
    property string workspace_occupied: lightMode ? colors.light_workspace_occupied : colors.normal_workspace_occupied
    property string active_widget_text: lightMode ? colors.light_active_widget_text : colors.normal_active_widget_text

    JsonAdapter {
        id: colors
        property string normal_background: ""
        property string normal_background_alt: ""
        property string normal_background_hover: ""
        property string normal_rose: ""
        property string normal_rose_dim: ""
        property string normal_foreground: ""
        property string normal_foreground_muted: ""
        property string normal_border: ""
        property string normal_element_alt: ""
        property string normal_urgent: ""
        property string normal_surface: ""
        property string normal_on_surface: ""
        property string normal_workspace_surface: ""
        property string normal_workspace_occupied: ""
        property string normal_active_widget_text: ""

        property string light_background: ""
        property string light_background_alt: ""
        property string light_background_hover: ""
        property string light_rose: ""
        property string light_rose_dim: ""
        property string light_foreground: ""
        property string light_foreground_muted: ""
        property string light_border: ""
        property string light_element_alt: ""
        property string light_urgent: ""
        property string light_surface: ""
        property string light_on_surface: ""
        property string light_workspace_surface: ""
        property string light_workspace_occupied: ""
        property string light_active_widget_text: ""

        property string background: ""
        property string background_alt: ""
        property string background_hover: ""
        property string rose: ""
        property string rose_dim: ""
        property string foreground: ""
        property string foreground_muted: ""
        property string border: ""
        property string shadow: ""
        property string element_alt: ""
        property string urgent: ""
        property string surface: ""
        property string on_surface: ""
        property string workspace_surface: ""
        property string workspace_occupied: ""
        property string active_widget_text: ""
    }
}
