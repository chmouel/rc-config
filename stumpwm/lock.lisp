(when (and *initializing*
           (and (probe-file "/usr/bin/xss-lock")
                (probe-file "/usr/bin/i3lock")))
  (setq lock-command "i3lock -c 000000 -f -e")
  (define-key *top-map* (kbd "s-l") (concatenate 'string "run-shell-command " lock-command))
  (run-shell-command "xset dpms 2000 2000 2000")
  (run-shell-command "xset s 1800 30")
  (run-shell-command (concatenate 'string "xss-lock -- " lock-command)))

;; vim: ft=lisp
;; Local Variables:
;; mode: lisp
;; mode: stumpwm
;; End:
