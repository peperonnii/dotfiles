import setproctitle

from fabric import Application
from fabric.utils import get_relative_path
from modules.bar import Bar
from modules.corners import Corners

if __name__ == "__main__":
    setproctitle.setproctitle("pEp-shell")
    corner = Corners()
    bar = Bar()
    app = Application("bar", bar, corner)
    app.set_stylesheet_from_file(get_relative_path("main.sass"))
    app.run()
