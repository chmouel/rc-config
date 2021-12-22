#!/usr/bin/env python
import click
import i3ipc

# always try to center the master windows the other are on the side
# supports up to 3 windows cause I don't usually use more


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
        windows_size = screen_w - (screen_w / 4)
        window.command(f"resize set {windows_size}")
        window.command("floating enable;move position center")


if __name__ == '__main__':
    gw()

# gw(reverse=True)
