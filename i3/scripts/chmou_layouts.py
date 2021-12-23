#!/usr/bin/env python
# Chmouel Boudjnah <chmouel@chouel.com>
# My custom layouts  :
#
# 1 windows -> float and center it, resize it as 2 third (for the apps in RESIZE_CLASSES)
# 2 windows -> left window is 1 third, right window is 2 third
# 3 windows -> left/right window half of a third, center window 2 third
# >3 windows is up to you and manual resize :-D
#
# it's currently bounded to a key, maybe we can use a hook instead but that may
# be too annoying

import click
import i3ipc

RESIZE_CLASSES = ["kitty", "emacs", "firefox", "chromium", "slack"]

def disable_floating(windows):
    [w.command("floating disable") for w in windows]

@click.command()
def gw():
    i3 = i3ipc.Connection()
    current_workspace = i3.get_tree().find_focused().workspace()
    windows = [x for x in current_workspace if x.name]
    screen_w = current_workspace.ipc_data['rect']['width']
    current_workspace.command("layout splith")

    if len(windows) == 2:
        left_window = windows[0]
        left_window_width = round(screen_w / 3.5)
        right_window_width = screen_w - left_window_width
        disable_floating(windows)
        left_window.command(f"resize set {left_window_width}")
    elif len(windows) == 3:
        left_window = windows[0]
        right_window = windows[2]
        left_window_width = round(screen_w / 5)
        right_window_width = round(screen_w / 6)
        disable_floating(windows)
        left_window.command(f"resize set {left_window_width}")
        right_window.command(f"resize set {right_window_width}")
    elif len(windows) == 1:
        window = windows[0]
        windows_size = round(screen_w - (screen_w / 4))
        window.command("floating enable")
        if window.window_class.lower() in RESIZE_CLASSES:
            window.command(f"resize set width {windows_size}px")
        window.command("move position center")

if __name__ == '__main__':
    gw()

# gw(reverse=True)
