#!/usr/bin/env bash
[[ ${1} == "open" ]] && {
    xdg-open 'https://github.com/notifications?query=reason%3Aparticipating+is%3Aunread++'
    exit
}
n=$(gh api -X GET /notifications --cache=1m -f per_page='30' \
       -f participating='true' --jq '.|length')
[[ ${n} > 0 ]] && echo "${n}"
