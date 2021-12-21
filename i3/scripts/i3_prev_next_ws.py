#!/usr/bin/env python
import click
import i3ipc


@click.command()
@click.option("--reverse", is_flag=True)
def gw(reverse: bool):
    i3 = i3ipc.Connection()
    workspaces = i3.get_workspaces()
    for i, ws in enumerate(workspaces):
        if ws.focused:
            if reverse:
                if i == 0:
                    n = len(workspaces) - 1
                else:
                    n = i - 1
            else:
                n = i + 1
                if n >= len(workspaces):
                    n = 0
            i3.command(f'workspace {workspaces[n].name}')


if __name__ == '__main__':
    gw()

# gw(reverse=True)
