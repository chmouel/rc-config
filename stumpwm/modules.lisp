(load-module "globalwindows")
(define-key *top-map* (kbd "s-\\") "global-windowlist")

(load-module "clipboard-history")
(define-key *root-map* (kbd "C-y") "show-clipboard-history")
(clipboard-history:start-clipboard-manager)

(load-module "swm-gaps")
(setf swm-gaps:*inner-gaps-size* 10
      swm-gaps:*outer-gaps-size* 7
      swm-gaps:*head-gaps-size* 0)
;; enable gap when we have a external monitor connect and not on laptop
(when (and (getenv "MONITOR")
           (string< "HDMI" (getenv "MONITOR"))
           *initializing*)
  (swm-gaps:toggle-gaps))
(define-key *groups-map* (kbd "g") "toggle-gaps")

(load-module "pass")

;; vim: ft=lisp
;; Local Variables:
;; mode: lisp
;; mode: stumpwm
;; End:
