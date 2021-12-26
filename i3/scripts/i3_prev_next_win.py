#!/usr/bin/env python
# Chmouel Boudjnah <chmouel@chmouel.com>
#
# Like OSX/Gnome it focus the same windows of the same class or app_id going
# from left to right
#
# by default only from the current ws unless --all is specified
#
# works with app_id (sway) and class_id (i3/wayland)
#
# config:
#
#  swaymsg 'bindsym $super+shift+grave exec i3_prev_next_win.py all'
#  swaymsg 'bindsym $super+grave exec i3_prev_next_win.py
#
# need python-click and python-i3ipc
#
# TODO: reverse sort

import click
import i3ipc


def find_same_of_workspace(focused, ws):
    ret = []
    for f in ws:
        if f.ipc_data.get("app_id") and f.app_id == focused.app_id:
            ret.append(f)
        # TODO: need to test on xwayland
        elif f.ipc_data.get("class_id") and f.class_id == focused.class_id:
            ret.append(f)
    return ret


def get_next_after_index(focused, wins):
    index = wins.index(focused)
    if index + 1 >= len(wins):
        next = wins[0]
    else:
        next = wins[index + 1]
    return next


@click.command()
@click.option("--all", is_flag=True)
def gw(all=True):
    i3 = i3ipc.Connection()
    tree = i3.get_tree()
    focused = tree.find_focused()
    current_workspace = focused.workspace()
    samewins = find_same_of_workspace(focused, current_workspace)
    if all:
        for ws in i3.get_workspaces():
            if ws.focused:
                continue
            workspace = i3.get_tree().find_by_id(ws.ipc_data["id"])
            wins = find_same_of_workspace(focused, workspace)
            if len(wins) > 0:
                samewins += wins

    next = get_next_after_index(focused, samewins)
    next.command("focus")


if __name__ == '__main__':
    gw()

# gw(reverse=True)
