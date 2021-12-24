#!/usr/bin/env python
# Chmouel Boudjnah <chmouel@chouel.com>
# My custom layouts  :
#
# 1 windows -> float and center it, resize it as 2 third (for the apps in RESIZE_CLASSES)
# 2 windows -> left window is 1 third, right window is 2 third
# 3 windows -> left/right window half of a third, center window 2 third
# >3 windows is up to you and manual resize :-D
#
# it's currently bounded to a key (super+c for me), maybe we can use a hook
# instead but that may be too annoying

import click
import i3ipc

VERBOSE = False


def log(msg):
    if VERBOSE:
        print(msg)


def disable_floating(windows):
    [w.command("floating disable") for w in windows]


@click.command()
@click.option("--verbose", "-v", is_flag=True)
@click.option("--one-no-resize", is_flag=True)
def chmoulayout(verbose=False, one_no_resize=False):
    global VERBOSE
    if verbose:
        VERBOSE = True

    i3 = i3ipc.Connection()
    current_workspace = i3.get_tree().find_focused().workspace()
    windows = [x for x in current_workspace if x.name]
    log(f"Number of windows on screen {len(windows)}")
    screen_w = current_workspace.ipc_data['rect']['width']
    screen_h = current_workspace.ipc_data['rect']['height']
    log(f"Screen width <> {screen_w}")
    log(f"Screen height ^ {screen_h}")
    current_workspace.command("layout splith")

    if len(windows) == 2:
        log("Using two windows mode")
        left_window = windows[0]
        left_window_width = round(screen_w / 3.5)
        log(f"Left windows width: {left_window_width}")
        right_window_width = screen_w - left_window_width
        log(f"Right windows width: {right_window_width}px")
        disable_floating(windows)
        left_window.command(f"resize set {left_window_width}px")
    elif len(windows) == 3:
        log("Using three windows mode")
        left_window = windows[0]
        right_window = windows[2]
        left_window_width = round(screen_w / 5)
        log(f"Left windows width: {left_window_width}")
        right_window_width = round(screen_w / 6)
        log(f"Right windows width: {right_window_width}")
        disable_floating(windows)
        left_window.command(f"resize set {left_window_width}px")
        right_window.command(f"resize set {right_window_width}px")
    elif len(windows) == 1:
        log("Using single window mode")
        window = windows[0]
        window_size = round(screen_w - (screen_w / 4))
        window.command("floating enable")
        log(f"Resize window to : {window_size}")
        if not one_no_resize:
            window.command(f"resize set width {window_size}px")
            window.command(f"resize set height {screen_h - 10}px")
        window.command("move position center")


if __name__ == '__main__':
    chmoulayout()
