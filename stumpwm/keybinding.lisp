
(defcommand firefox () ()
  "run firefox"
  (run-or-raise "firefox" '(:class "firefox")))
(define-key *top-map* (kbd "s-f") "firefox")

(defcommand chromium () ()
  "run chromium"
  (run-or-raise "chromium" '(:class "Chromium")))
(define-key *top-map* (kbd "s-c") "chromium")

(defcommand spotify () ()
  (run-or-raise "spotify" '(:class "Spotify")))
(define-key *top-map* (kbd "s-m") "spotify")

(defcommand kitty (&optional program) ()
            (run-shell-command (if program
                                   (format nil "kitty ~A" program)
                                   "kitty")))
(define-key *top-map* (kbd "s-S-RET") "kitty")

(defcommand kittyfocus () ()
  "Run or switch to kitty term."
  (run-or-raise "kitty" '(:class "kitty")))
(define-key *top-map* (kbd "s-RET") "kittyfocus")

(defcommand kittypull () ()
  "Pull kitty term here"
  (run-or-pull "kitty" '(:class "kitty")))
(define-key *top-map* (kbd "s-C-RET") "kittyfocus")

(defcommand emacs () ()
  (run-or-raise "emacs" '(:class "Emacs")))
(define-key *top-map* (kbd "s-e") "emacs")

(defcommand slack () ()
  "Run or switch to kitty term."
  (run-or-raise "slack" '(:class "Slack")))
(define-key *top-map* (kbd "s-s") "slack")

(define-key *top-map* (kbd "s-;") "colon")

(define-key *root-map* (kbd "R") "loadrc")
(define-key *root-map* (kbd "r") "iresize")
(define-key *root-map* (kbd "s") "hsplit")
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
(define-key *top-map* (kbd "s-Up") "restore-from-file onethird")
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
;; (define-key *top-map* (kbd "s-o") "only")

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
