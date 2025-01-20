from fabric.widgets.box import Box
from fabric.widgets.shapes import Corner
from fabric.widgets.wayland import WaylandWindow as Window


class MyCorner(Box):
    def __init__(self, corner, name):
        super().__init__(
            name="corner-container",
            children=Corner(
                name=name,
                orientation=corner,
                size=30,
            ),
        )

class Corners(Window):
    def __init__(self):
        super().__init__(
            name="corners",
            layer="overlay",
            anchor="top bottom left right",
            exclusivity="normal",
            pass_through=True,
            visible=False,
            all_visible=False,
        )

        self.all_corners = Box(
            name="all-corners",
            orientation="v",
            h_expand=True,
            v_expand=True,
            h_align="fill",
            v_align="fill",
            children=[
                Box(
                    name="top-corners",
                    orientation="h",
                    h_align="fill",
                    children=[
                        MyCorner("top-left", "tl"),
                        Box(h_expand=True),
                        MyCorner("top-right", "tr"),
                    ],
                ),
                Box(v_expand=True),
                Box(
                    name="bottom-corners",
                    orientation="h",
                    h_align="fill",
                    children=[
                        MyCorner("bottom-left", "bl"),
                        Box(h_expand=True),
                        MyCorner("bottom-right", "br"),
                    ],
                ),
            ],
        )

        self.add(self.all_corners)
        self.show_all()
