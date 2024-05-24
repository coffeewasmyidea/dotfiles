import atexit
import os
import readline

histfile = os.path.join(
    os.path.expanduser("~/.cache/python"), ".python_history"
)

try:
    readline.read_history_file(histfile)
    # default history len is -1 (infinite), which may grow unruly
    readline.set_history_length(10000)
except FileNotFoundError:
    pass

atexit.register(readline.write_history_file, histfile)

import os, sys, asyncio, typing, time, datetime

autoload_pkg = ["os", "sys", "asyncio", "typing", "time", "datetime"]

print("Autoloaded {pkg_list}".format(pkg_list=[x for x in autoload_pkg]))
