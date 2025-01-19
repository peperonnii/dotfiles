import psutil

from fabric.utils import (FormattedString, bulk_replace, get_relative_path,
                          invoke_repeater)
from fabric.widgets.box import Box
from fabric.widgets.circularprogressbar import CircularProgressBar
from fabric.widgets.image import Image
from fabric.widgets.label import Label
from fabric.widgets.overlay import Overlay


class Resources(Box):
    def __init__(self):
        super().__init__(
            name="resource-container",
            orientation="v",
            spacing=6,
            h_align="center",
            v_align="center"
        )

        self.cpu_progress_bar = CircularProgressBar(
            name="cpu-progress-bar", pie=False, size=34, line_width=3
        )
        self.cpu_container = Overlay(
            child=self.cpu_progress_bar,
            overlays=[
                Image(
                    name="cpu-png",
                    image_file="/home/joebiden/.config/fabric/icons/cpu.svg",
                    size=18
                )
            ]
        )

        self.ram_progress_bar = CircularProgressBar(
            name="ram-progress-bar", pie=False, size=34, line_width=3
        )
        self.ram_container = Overlay(
            child=self.ram_progress_bar,
            overlays=[
                Image(
                    name="ram-png",
                    image_file="/home/joebiden/.config/fabric/icons/ram.svg",
                    size=18
                )
            ]
        )
        self.swap_progress_bar = CircularProgressBar(
            name="swap-progress-bar", pie=False, size=34, line_width=3, min_value=0
        )
        self.swap_container = Overlay(
            child=self.swap_progress_bar,
            overlays=[
                Image(
                    name="swap-png",
                    image_file="/home/joebiden/.config/fabric/icons/swap.svg",
                    size=18
                )
            ]
        )

        self.add(self.cpu_container)
        self.add(self.ram_container)
        self.add(self.swap_container)

        invoke_repeater(1000, self.update_progress_bars)

    def update_progress_bars(self):
        self.cpu_progress_bar.value = psutil.cpu_percent() / 100
        self.ram_progress_bar.value = psutil.virtual_memory().percent / 100 
        self.swap_progress_bar.value = psutil.swap_memory().percent / 100
        return True

