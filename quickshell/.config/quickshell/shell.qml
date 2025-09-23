import Quickshell
import QtQuick.Layouts

import "bar"

Scope {
	Bar {}
}

// import Quickshell.Hyprland
// import QtQuick
// import QtQuick.Layouts
//
// PanelWindow {
// 	implicitHeight: 30
// 	anchors {
// 		top: true
// 		left: true
// 		right: true
// 	}
//
//     RowLayout {
//         id: workspaces
// 		anchors.fill: parent
//
// 		Repeater {
// 			model: Hyprland.workspaces
//
// 			delegate: Rectangle {
// 				width: 30
// 				height: width
//
// 				color: (modelData.active) ? "red" : "grey"
//
// 				Text {
// 					anchors.centerIn: parent
// 					text: (modelData.id > 0) ? modelData.id : modelData.name
// 				}
//
// 				MouseArea {
// 					anchors.fill: parent
// 					onClicked: {
// 						Hyprland.dispatch("workspace " + modelData.name)
// 					}
// 				}
// 			}
// 		}
//
// 		Item {
// 			Layout.fillWidth: true
// 		}
//
// 		Text {
// 			id: windowTitle
// 			property int maxLength: 50
// 			text: (Hyprland.activeToplevel.title.length > maxLength) ? Hyprland.activeToplevel.title.substring(0,maxLength) + "..." : Hyprland.activeToplevel.title
// 		}
//
// 		Item {
// 			Layout.fillWidth: true
// 		}
//
// 		Item {
//
// 			implicitWidth: label.implicitWidth
// 			Text {
// 				id: label
// 				text: "test"
// 				anchors {
// 					centerIn: parent
// 				}
// 			}
// 		}
// 	}
//
// }
