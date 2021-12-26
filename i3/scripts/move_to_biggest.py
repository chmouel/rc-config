#!/usr/bin/env python3
#
# Promotes the focused window by swapping it with the largest window.
#
# adapted from https://aduros.com/blog/hacking-i3-window-promoting/
#
# It tries to do the right thing, to focus the current window in the largest area
# unless -n is specified, may work best only for two windows, maybe we can add
# rotation between windows but that would need some persistence.

import click
import i3ipc


def find_biggest_window(container):
    max_leaf = None
    max_area = 0
    for leaf in container.leaves():
        rect = leaf.rect
        area = rect.width * rect.height
        if not leaf.focused and area > max_area:
            max_area = area
            max_leaf = leaf
    return (max_leaf, max_area)


def get_focused_area(container):
    for leaf in container.leaves():
        if leaf.focused:
            rect = leaf.rect
            return rect.width * rect.height


@click.command()
@click.option("--no-focus", "-n", is_flag=True)
def move_to_biggest(no_focus: bool = True):
    i3 = i3ipc.Connection()
    for reply in i3.get_workspaces():
        if reply.focused:
            workspace = i3.get_tree().find_by_id(reply.ipc_data["id"])
            focused_area = get_focused_area(workspace)
            master, master_area = find_biggest_window(workspace)
            i3.command("swap container with con_id %s" % master.id)

            if not no_focus:
                if focused_area >= master_area:
                    master.command("focus")


if __name__ == '__main__':
    move_to_biggest()
