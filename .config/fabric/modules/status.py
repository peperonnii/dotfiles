import socket

import psutil

from fabric.utils import get_relative_path, invoke_repeater
from fabric.widgets.box import Box
from fabric.widgets.svg import Svg


class Status(Box):
    def __init__(self):
        super().__init__(
            name="status",
            orientation="v",
            spacing=2,
            h_align="center",
            v_align="center"
        )

        self.wifi = Svg(
            name="wifi-svg",
            svg_file=get_relative_path("../icons/wifi-down.svg"),
            size=18
        )
        self.bluetooth = Svg(
            name="bluetooth-svg",
            svg_file=get_relative_path("../icons/bluetooth-down.svg"),
            size=18
        )
        self.add(self.bluetooth)
        self.add(self.wifi)

        invoke_repeater(10000, self.check_internet)
        invoke_repeater(10000, self.check_bluetooth)

    def check_internet(self):
        interfaces = psutil.net_if_stats()
        active_interfaces = [iface for iface, stats in interfaces.items() if stats.isup]
        if not active_interfaces:
            print("NO internet")
        else:
            try:
                socket.create_connection(("1.1.1.1", 53), timeout=3)
                self.wifi.set_from_file(get_relative_path("../icons/wifi-up.svg"))
            except OSError:
                print("internet disconnected")
                self.wifi.set_from_file(get_relative_path("../icons/wifi-down.svg"))
        return True

    def check_bluetooth(self):
        interfaces = psutil.net_if_stats()
        for iface, stats in interfaces.items():
            if "bluetooth" in iface.lower() and stats.isup:
                print(f"Bluetooth interface '{iface}' is active.")
                self.bluetooth.set_from_file(get_relative_path("../icons/bluetooth-up.svg"))

        return True


