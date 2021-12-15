;;; Gaps
(load-module "swm-gaps")
; ;; Inner gaps run along all the 4 borders of a window
(setf swm-gaps:*inner-gaps-size* 2)
(when *initializing*
  (swm-gaps:toggle-gaps))
(define-key *groups-map* (kbd "g") "toggle-gaps")

(load-module "globalwindows")
(define-key *top-map* (kbd "s-`") "global-windowlist")
(define-key *top-map* (kbd "s-~") "global-pull-windowlist")

(load-module "clipboard-history")
(define-key *root-map* (kbd "C-y") "show-clipboard-history")
(clipboard-history:start-clipboard-manager)

;; (load-module "swm-golden-ratio")
;; (swm-golden-ratio:toggle-golden-ratio)

(load-module "pass")

