//  ────────────────────────────────────────────────────────────
//                     ╔╗  ╔╗ ╔══╗      ╔════╗
//                     ║╚╗╔╝║ ╚╣╠╝      ║╔╗╔╗║
//                     ╚╗╚╝╔╝  ║║  ╔══╗ ╚╝║║╚╝
//                      ╚╗╔╝   ║║  ║╔╗║   ║║
//                       ║║   ╔╣╠╗ ║╚╝║   ║║
//                       ╚╝   ╚══╝ ╚══╝   ╚╝
//    ╔╗╔═╗                    ╔╗                     ╔╗
//    ║║║╔╝                   ╔╝╚╗                    ║║
//    ║╚╝╝  ╔══╗ ╔══╗ ╔══╗  ╔╗╚╗╔╝  ╔══╗ ╔╗ ╔╗╔╗ ╔══╗ ║║  ╔══╗
//    ║╔╗║  ║║═╣ ║║═╣ ║╔╗║  ╠╣ ║║   ║ ═╣ ╠╣ ║╚╝║ ║╔╗║ ║║  ║║═╣
//    ║║║╚╗ ║║═╣ ║║═╣ ║╚╝║  ║║ ║╚╗  ╠═ ║ ║║ ║║║║ ║╚╝║ ║╚╗ ║║═╣
//    ╚╝╚═╝ ╚══╝ ╚══╝ ║╔═╝  ╚╝ ╚═╝  ╚══╝ ╚╝ ╚╩╩╝ ║╔═╝ ╚═╝ ╚══╝
//                    ║║                         ║║
//                    ╚╝                         ╚╝
//
//    Lead Maintainer: Roman Kutashenko <kutashenko@gmail.com>
//  ────────────────────────────────────────────────────────────

import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12

import "../../theme"
import "../../components"

RowLayout {
    property variant modelData: none
    property bool containsMouse: btnInfo.containsMouse || btnExport.containsMouse || btnDelete.containsMouse
    property int wSz: 150

    signal showInfo()

    id: actionsBlock
    visible: false
    anchors.right: parent.right
    width: 0

    ImageButton {
        id: btnExport
        image: "dark/export"
        onClicked: {
            console.log("Export root of trust")
        }
    }

    ImageButton {
        id: btnDelete
        image: "dark/delete"
        onClicked: {
            console.log("Delete root of trust")
        }
    }

    ImageButton {
        id: btnInfo
        image: "dark/info"
        onClicked: { showRoTInfo(model) }
    }

    Item {
        Layout.fillWidth: true
    }

    states: [
        State {
            name: "visible"
            PropertyChanges { target: actionsBlock; width: wSz    }
            PropertyChanges { target: actionsBlock; visible: true }
        },
        State {
            name: "hidden"
            PropertyChanges { target: actionsBlock; width: 0       }
            PropertyChanges { target: actionsBlock; visible: false }
        }]

    transitions: Transition {
        NumberAnimation { property: "width"; duration: 100 }
    }
}
