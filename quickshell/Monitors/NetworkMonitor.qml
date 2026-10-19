pragma Singleton

import Quickshell
import Quickshell.Networking

Singleton {
    id: root

    readonly property bool connected: currentNetwork.connected
    readonly property string networkName: currentNetwork.name
    readonly property real networkStrength: currentNetwork.signalStrength

    readonly property list<NetworkDevice> devices: Networking.devices.values
    readonly property NetworkDevice wifiDevice: devices.find(d => d.type === DeviceType.Wifi) ?? null
    readonly property bool wired: devices.some(d => d.connected && d.type !== DeviceType.Wifi)

    readonly property list<Network> networks: wifiDevice.networks.values
    readonly property Network currentNetwork: networks.find(n => n.connected) ?? null
}