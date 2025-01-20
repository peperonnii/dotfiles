from fabric.widgets.box import Box
from fabric.widgets.button import Button
from fabric.widgets.centerbox import CenterBox
from fabric.widgets.eventbox import EventBox
from fabric.widgets.label import Label
from fabric.widgets.revealer import Revealer
from fabric.widgets.wayland import \
    WaylandWindow as Window  # Replace the previous Window import with this


class SideBar(Window):
    def __init__(self, **kwargs):
        super().__init__(
            name="sidebar",
            layer="top",
            anchor="left top bottom",
            exclusivity="auto",
            visible=False,
            size=300,
            **kwargs
        )
        self.test_box = Box(
            label="hellow"
        )
        self.add(self.test_box)
        self.show_all()
