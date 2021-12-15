
(define-key *top-map* (kbd "s-f") "run-shell-command jumpapp firefox")
(define-key *top-map* (kbd "s-w") "run-shell-command jumpapp -c Chromium chromium")
(define-key *top-map* (kbd "s-m") "run-shell-command jumpapp -c Spotify spotify")
(define-key *top-map* (kbd "s-S-RET") "run-shell-command kitty")
(define-key *top-map* (kbd "s-RET") "run-shell-command jumpapp kitty")
(define-key *top-map* (kbd "s-e") "run-shell-command jumpapp -f -i emacs -- emacsclient -c -a emacs")
(define-key *top-map* (kbd "s-E") "run-shell-command splatmoji type")
(define-key *top-map* (kbd "s-s") "run-shell-command jumpapp -c Slack slack")

(define-key *top-map* (kbd "s-;") "colon")

(define-key *root-map* (kbd "R") "loadrc")
(define-key *root-map* (kbd "r") "iresize")
(define-key *root-map* (kbd "s") "hsplit")
(define-key *top-map*  (kbd "s-C-s") "hsplit")
(define-key *root-map* (kbd "S") "vsplit")
(define-key *root-map* (kbd "f") "float-this")
(define-key *root-map* (kbd "F") "unfloat-this")

(define-key *top-map* (kbd "s-C-Left") "exchange-direction left")
(define-key *top-map* (kbd "s-C-Right") "exchange-direction right")
(define-key *top-map* (kbd "s-S-Up") "exchange-direction up")
(define-key *top-map* (kbd "s-S-Left") "move-window left")
(define-key *top-map* (kbd "s-S-Right") "move-window right")
(define-key *top-map* (kbd "s-Left") "move-focus left")
(define-key *top-map* (kbd "s-Down") "move-focus down")
(define-key *top-map* (kbd "s-Up") "move-focus up")
(define-key *top-map* (kbd "s-c") "restore-from-file onethird")
(define-key *top-map* (kbd "s-Right") "move-focus right")

(define-key *top-map* (kbd "M-TAB") "next-in-frame")
(define-key *root-map* (kbd "Q") "quit")
(define-key *top-map* (kbd "M-F2") "exec")
(define-key *top-map* (kbd "M-F4") "kill")
(define-key *top-map* (kbd "s-ISO_Left_Tab") "prev-in-frame")
(define-key *top-map* (kbd "s-Tab") "next")

(define-key *top-map* (kbd "s-1") "gselect 1")
(define-key *top-map* (kbd "s-2") "gselect 2")
(define-key *top-map* (kbd "s-3") "gselect 3")
(define-key *top-map* (kbd "s-4") "gselect 4")
(define-key *top-map* (kbd "s-5") "gselect 5")

(define-key *top-map* (kbd "s-M-Left") "gprev")
(define-key *top-map* (kbd "s-M-Right") "gnext")
(define-key *top-map* (kbd "s-Prior") "gprev")
(define-key *top-map* (kbd "s-Next") "gnext")

(define-key *top-map* (kbd "s-C") "only")

(define-key *top-map* (kbd "s-\\") "gselect")

(define-key *root-map* (kbd "N") "exec dunstctl close-all")

(define-key *top-map* (kbd "s-!") "gmove-and-follow 1")
(define-key *top-map* (kbd "s-@") "gmove-and-follow 2")
(define-key *top-map* (kbd "s-#") "gmove-and-follow 3")
(define-key *top-map* (kbd "s-$") "gmove-and-follow 4")
(define-key *top-map* (kbd "s-%") "gmove-and-follow 5")

(define-key *top-map* (kbd "XF86AudioRaiseVolume") "exec pactl -- set-sink-volume 0 +5%")
(define-key *top-map* (kbd "XF86AudioLowerVolume") "exec pactl -- set-sink-volume 0 -5%")
(define-key *top-map* (kbd "XF86AudioMute") "exec pactl -- set-sink-mute @DEFAULT_SINK@ toggle")
(define-key *top-map* (kbd "XF86AudioPlay") "exec playerctl play-pause")
(define-key *top-map* (kbd "XF86AudioNext") "exec playerctl next")
(define-key *top-map* (kbd "XF86AudioPrev") "exec playerctl previous")
(define-key *top-map* (kbd "XF86AudioStop") "exec playerctl stop")

;;
(define-key *root-map* (kbd "Q") "quit")
