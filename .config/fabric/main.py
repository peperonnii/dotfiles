import logging
import subprocess

import setproctitle

from fabric import Application
from fabric.utils import get_relative_path
from modules.bar import Bar
from modules.corners import Corners

if __name__ == "__main__":
    setproctitle.setproctitle("pEp-shell")
    corner = Corners()
    bar = Bar()
    app = Application("bar", 
        bar,
        corner
    )
    subprocess.run(["sass","main.scss","compiled.css","--no-source-map"])
    logging.info("SCSS stylesheets have succesfully compiled!")
    app.set_stylesheet_from_file(get_relative_path("compiled.css"))
    app.run()



