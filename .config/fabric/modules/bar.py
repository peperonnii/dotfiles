from fabric.hyprland.widgets import WorkspaceButton, Workspaces
from fabric.widgets.box import Box
from fabric.widgets.centerbox import CenterBox
from fabric.widgets.datetime import DateTime
from fabric.widgets.shapes.corner import Corner
from fabric.widgets.wayland import \
    WaylandWindow as Window  # Replace the previous Window import with this


class Bar(Window):
    def __init__(self, **kwargs):
        super().__init__(
            name="bar",
            layer="top",
            anchor="left top bottom",
            exclusivity="auto",
            visible=False,
            all_visible=True,
            **kwargs
        )

        self.center_box = CenterBox(name="bar", orientation="v")

        self.workspaces = Workspaces(
            name="workspaces",
            invert_scroll=True,
            empty_scroll=True,
            v_align="fill",
            orientation="v",
            spacing=10,
            buttons=[WorkspaceButton(id=i, label=f"{i}") for i in range(1, 11)],
        )
        self.date_time = DateTime(
            name="date-time",
            formatters="%H\n%M\n  •\n%d\n%m",
            h_align="center",
            v_align="center"
        )

        # self.corners = CenterBox(
        #     name="corners",
        #     orientation="v",
        # )
        # self.corners_top = Corner(name="corner", orientation="top-left", size=30, h_expand=False)
        # self.corners_bot = Corner(name="corner", orientation="bottom-left", size=30)

        # self.center_box.add_start(self.corners_top)
        self.center_box.add_start(self.date_time)
        self.center_box.add_center(self.workspaces)
        # self.center_box.add_end(self.corners_bot)

        self.full_box = Box(
            name= "full-box",
            orientation="h",
            h_expand=False,
            children=[
                self.center_box,
            ]
        )
        self.add(self.full_box)
