
(define-key *top-map* (kbd "s-f") "run-shell-command jumpapp firefox")
(define-key *top-map* (kbd "s-w") "run-shell-command jumpapp -c Chromium chromium")
(define-key *top-map* (kbd "s-m") "run-shell-command jumpapp -c Spotify spotify")
(define-key *top-map* (kbd "s-S-RET") "run-shell-command kitty")
(define-key *top-map* (kbd "s-RET") "run-shell-command jumpapp kitty")
(define-key *top-map* (kbd "s-e") "run-shell-command jumpapp -f -i emacs -- emacsclient -c -a emacs")
(define-key *top-map* (kbd "s-C-e") "run-shell-command emacsclient -c -a emacs")
(define-key *top-map* (kbd "s-E") "run-shell-command splatmoji type")
(define-key *top-map* (kbd "s-s") "run-shell-command jumpapp -c Slack slack")

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
(define-key *top-map* (kbd "s-S-Up") "move-window up")
(define-key *top-map* (kbd "s-S-Down") "move-window down")

(define-key *top-map* (kbd "s-Left") "move-focus left")
(define-key *top-map* (kbd "s-Down") "move-focus down")
(define-key *top-map* (kbd "s-Up") "move-focus up")
(define-key *top-map* (kbd "s-Right") "move-focus right")

(if (probe-file "/usr/bin/splatmoji")
    (define-key *top-map* (kbd "s-C-space") "run-shell-command splatmoji copy"))

;;; using alttab binary instead
;; (define-key *top-map* (kbd "M-TAB") "next-in-frame")
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

(define-key *root-map* (kbd "1") "restore-from-file layout")
(define-key *root-map* (kbd "2") "restore-from-file layout2")
(define-key *root-map* (kbd "F2") "restore-from-file layout")
(define-key *root-map* (kbd "3") "restore-from-file layout3")
(define-key *root-map* (kbd "0") "only")

(define-key *root-map* (kbd "N") "exec dunstctl close-all")

(define-key *top-map* (kbd "s-!") "gmove-and-follow 1")
(define-key *top-map* (kbd "s-@") "gmove-and-follow 2")
(define-key *top-map* (kbd "s-#") "gmove-and-follow 3")
(define-key *top-map* (kbd "s-$") "gmove-and-follow 4")
(define-key *top-map* (kbd "s-%") "gmove-and-follow 5")

(if (probe-file "/usr/bin/flameshot")
    (define-key *root-map* (kbd "F12") "run-shell-command flameshot gui"))

(define-key *top-map* (kbd "XF86AudioRaiseVolume") "exec pactl -- set-sink-volume 0 +5%")
(define-key *top-map* (kbd "XF86AudioLowerVolume") "exec pactl -- set-sink-volume 0 -5%")
(define-key *top-map* (kbd "XF86AudioMute") "exec pactl -- set-sink-mute @DEFAULT_SINK@ toggle")
(define-key *top-map* (kbd "XF86AudioPlay") "exec playerctl play-pause")
(define-key *top-map* (kbd "XF86AudioNext") "exec playerctl next")
(define-key *top-map* (kbd "XF86AudioPrev") "exec playerctl previous")
(define-key *top-map* (kbd "XF86AudioStop") "exec playerctl stop")

;; vim: ft=lisp
;; Local Variables:
;; mode: lisp
;; mode: stumpwm
;; End:
