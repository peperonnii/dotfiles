from fabric.system_tray.widgets import SystemTray
from fabric.widgets.box import Box
from fabric.widgets.button import Button
from fabric.widgets.image import Image
from fabric.widgets.revealer import Revealer


class Tray(Box):
    def __init__(self):
        super().__init__(
            name="tray-container",
            orientation="v",
            spacing=4,
            h_align="center",
            v_align="center"
        )

        self.system_tray = SystemTray(
            name="tray",
            h_expand=False,
            v_expand=False,
            orientation="v",
            icon_size=18
        )
        self.system_tray_revealer = Revealer (
            name="tray",
            child=self.system_tray,
            child_revealed=False,
            transition_type="slide-up",
            transition_duration=150

            
        )

        self.system_tray_button = Button(
            name="tray-button",
            child=self.system_tray_revealer,
            image=Image(
                image_file="/home/joebiden/.config/fabric/icons/up-arrow.svg",
                size=20
            ),
        )       

        self.add(self.system_tray_revealer)
        self.system_tray_button.connect("clicked", self.toggle_tray)
        self.add(self.system_tray_button)


    toggled = False
    def toggle_tray(self, button: Button):
        if self.toggled:
            self.system_tray_revealer.unreveal()
            self.toggled = False
            # print(self.toggled)
        else:
            self.system_tray_revealer.reveal()
            self.toggled = True




