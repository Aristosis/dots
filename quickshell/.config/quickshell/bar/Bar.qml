import Quickshell
import Quickshell.Hyprland
import QtQuick.Layouts
import QtQuick

Scope {
	PanelWindow {
		implicitHeight: 30
		color: "grey"
		anchors {
			top: true
			left: true
			right: true
		}

		RowLayout {
			id: bar

			RowLayout {
				id: workspaces
				spacing: 0

				Repeater {
					model: Hyprland.workspaces
					delegate: Rectangle {
						id: button
						height: 30
						width: height

						color: (modelData.active) ? "turquoise" : "white"

						Text {
							id: label
							text: modelData.name
							anchors.centerIn: parent
						}

						MouseArea {
							anchors.fill: parent
							onClicked: {
								Hyprland.dispatch("workspace " + modelData.name)
							}
						}
					}
				}
			}


			Item {
				id: tray
			}

			Item {
				id: stats
			}

		}

		Item {
			id: windowName
			anchors.fill: parent
			Text {
				text: "hi"
				anchors.centerIn: parent
			}
		}
	}
}
