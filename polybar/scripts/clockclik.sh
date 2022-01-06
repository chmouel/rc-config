#!/usr/bin/env bash
set -eux

kitty --class=GClock -- /bin/bash -c "batz;echo;cal -3;gcalcli agenda --nodeclined --default-calendar=Lyc --default-calendar=Work --details end --details=calendar --color-now-marker=green |head -15;read"
