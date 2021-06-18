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

import "qrc:/qml/pages/settings/extensions"
import "qrc:/qml/pages/settings"
import "qrc:/qml/components"

Page {
    readonly property int menuIdx: 0
    readonly property int wifiNetworksIdx: 1
    readonly property int wifiPassIdx: 2
    readonly property int eventsIdx: 3

    id: settingsPage

    background: Rectangle {
        color: "transparent"
    }

    SwipeView {
        readonly property int menuIdx: 0
        readonly property int wifiNetworksIdx: 1
        readonly property int wifiPassIdx: 2
        readonly property int eventsIdx: 3
        readonly property int rotIdx: 4
        readonly property int networksIdx: 5
        readonly property int themeIdx: 6
        readonly property int extDevicesIdx: 7
        readonly property int integrationsIdx: 8
        readonly property int onePluginIdx: 9
        readonly property int oneIntegrationIdx: 10

        property int backPageIdx: menuIdx

        id: settingsSwipeView
        anchors.fill: parent
        interactive: false
        currentIndex: menuIdx

        SettingsMenuPage {
            id: menuSettingsPage
        }

        WiFiSettingsPage {
            id: wifiSettingsPage
        }

        WiFiPasswordPage {
            id: wifiPassSettingsPage
        }

        EventsSettingsPage {
            id: eventsSettingsPage
        }

        RoTSettingsPage {
            id: rotSettingsPage
        }

        NetworksSettingsPage {
            id: networksSettingsPage
        }
        
        ThemeListPage {
            id: themeListPage
        }

        ExtDevicesListPage {
            id: extDeviccesListPage
        }

        ExtIntegrationsListPage {
            id: extIntegrationsListPage
        }

        ExtPluginPage {
            id: extPluginPage
        }

        ExtIntegrationPage {
            id: extIntegrationPage
        }
    }

    onVisibleChanged: {
        if (visible) {
            showMenuSettings()
        }
    }

    function swipeSettingsShow(idx) {
        settingsSwipeView.currentIndex = idx
        for (var i = 0; i < settingsSwipeView.count; ++i) {
            var item = settingsSwipeView.itemAt(i)
            item.visible = i == settingsSwipeView.currentIndex
        }
    }

     function showMenuSettings() {
        swipeSettingsShow(settingsSwipeView.menuIdx)
     }

    function showWiFiSettings() {
        wifiPassSettingsPage.prepareLocation("credentials")
        swipeSettingsShow(settingsSwipeView.wifiNetworksIdx)
    }

    function showRoTSettings() {
        swipeSettingsShow(settingsSwipeView.rotIdx)
    }

    function showIoTNetworkSettings() {
        swipeSettingsShow(settingsSwipeView.networksIdx)
    }

    function showWiFiPassword(ssid) {
        console.log("showWiFiPassword: ", ssid)
        wifiPassSettingsPage.prepare(ssid)
    }

    function showEventsSettings() {
        swipeSettingsShow(settingsSwipeView.eventsIdx)
    }

    function showThemeList() {
        swipeSettingsShow(settingsSwipeView.themeIdx)
    }

    function showExtDevicesList(available) {
        if (available) {
            extDeviccesListPage.swipeShowPlugins(extDeviccesListPage.availableIdx)
        } else {
            extDeviccesListPage.swipeShowPlugins(extDeviccesListPage.installedIdx)
        }
        swipeSettingsShow(settingsSwipeView.extDevicesIdx)
    }

    function showIntegrationsList() {
        swipeSettingsShow(settingsSwipeView.integrationsIdx)
    }

    function showPluginPage(plugin, backAction) {
        extPluginPage.plugin = plugin
        extPluginPage.backAction = backAction
        swipeSettingsShow(settingsSwipeView.onePluginIdx)
    }

    function showIntegrationPage(integration, backAction) {
        extIntegrationPage.integration = integration
        extIntegrationPage.backAction = backAction
        swipeSettingsShow(settingsSwipeView.oneIntegrationIdx)
    }

    function backInSettings() {
        swipeSettingsShow(settingsSwipeView.backPageIdx)
    }
    function setPassPageLocation(location) {
        wifiPassSettingsPage.prepareLocation(location)
    }
}
