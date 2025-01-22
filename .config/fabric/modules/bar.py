
from fabric.hyprland.widgets import WorkspaceButton, Workspaces
from fabric.utils import get_relative_path, invoke_repeater
from fabric.widgets.box import Box
from fabric.widgets.centerbox import CenterBox
from fabric.widgets.datetime import DateTime
from fabric.widgets.image import Image
from fabric.widgets.svg import Svg
from fabric.widgets.wayland import \
    WaylandWindow as Window  # Replace the previous Window import with this
from modules.circles import Resources
from modules.status import Status
from modules.systemtray import Tray


class Bar(Window):
    def __init__(self, **kwargs):
        super().__init__(
            name="bar",
            layer="top",
            anchor="left top bottom",
            exclusivity="auto",
            visible=False,
            **kwargs
        )

        self.separator = Box(name="separator")

        self.center_box = CenterBox(name="bar", orientation="v")

        self.workspaces = Workspaces(
            name="workspaces",
            invert_scroll=True,
            empty_scroll=True,
            v_align="fill",
            orientation="v",
            spacing=0,
            buttons=[WorkspaceButton(id=i, label=f"{i}") for i in range(1, 11)],
        )

        self.time = DateTime(
            name="time",
            formatters="%H\n%M",
        )
        self.date = DateTime(
            name="date",
            formatters="%d\n%m",
        )

        self.date_time = Box(
            name="date-time",
            h_align="center",
            v_align="center",
            orientation="v",
            children=[
                self.time,
                # self.separator,
                self.date
            ]
        )


        self.center_box.add_start(self.date_time)
        self.center_box.add_start(Resources())
        self.center_box.add_center(self.workspaces)
        self.center_box.add_end(Tray())
        self.center_box.add_end(Status())
        self.full_box = Box(
            name="full-box",
            orientation="h",
            h_expand=False,
            children=[
                self.center_box,
            ]
        )
        self.add(self.full_box)
        self.show_all()





