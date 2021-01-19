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

import "../../../../components"
import "../../../../../js/devices/pc.js" as PCDevice

Page {
    id: createUserPage

    background: Rectangle {
        color: "transparent"
    }

    header: Header {
        title: qsTr("Create User")
        backAction: function() { showRPiSettings() }
    }

    Form {
            id: form
            stretched: true

            ColumnLayout {
                Layout.fillHeight: true
                Layout.fillWidth: true
                Layout.topMargin: 40
                Layout.bottomMargin: 20

                spacing: 15

                InputTextField {
                    id: userName
                    label: qsTr("User name")
                    placeholderText: qsTr("Enter new user name")
                }

                Password {
                    id: pass1
                    label: qsTr("Password")
                    placeholderText: qsTr("Enter new password")
                }

                Password {
                    id: pass2
                    label: qsTr("Password check")
                    placeholderText: qsTr("Enter the password again")
                }

                FormSecondaryButton {
                    Layout.topMargin: 20
                    Layout.bottomMargin: 10
                    Layout.leftMargin: 60
                    text: qsTr("Save")
                    onClicked: {
                        PCDevice.createUser(rpiPage.controller.macAddr, "user123", "pass1")
                        //        PCDevice.setNetworkParams("02:02:02:02:02:02", "wifi", true, "192.168.0.105", "192.168.0.1", "8.8.8.8", "255.255.255.0")
                    }
                }

                Item {
                    Layout.fillHeight: true
                }
            }
        }
}