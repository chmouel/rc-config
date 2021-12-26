#!/usr/bin/env bash
set -eux

kitty --class=GClock -- /bin/bash -c "batz;echo;cal -3;gcalcli agenda --nodeclined --default-calendar=Work;read"
