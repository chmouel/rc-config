;; (use-modules (srfi srfi-19))


;; ;; This value is used for judge `clicking are continuously or not'
;; (define click-separation-threshold-nanosec 250000000) 

;; (define (time-to-nanosecond time)
;;   (+ (* (time-second time)
;;         (expt 10 9))
;;      (time-nanosecond time)))

;; (define (emit-command k commands)
;;   (let ((cmd (assoc k commands)))
;;     (if cmd
;;         (eval (cdr cmd) (interaction-environment)))))

;; (define (multi-click-key key commands-normal . commands-long)
;;   (let ((time (current-time))
;;         (count 0))
;;     (unless (list? key)
;;       (set! key (list key)))
;;     (set! commands-long (if (null? commands-long)
;;                             #f
;;                             (begin
;;                               (set! commands-long (car commands-long))
;;                               (if (eq? #t commands-long)
;;                                   commands-normal
;;                                   commands-long))))
;;     (xbindkey-function key (lambda ()
;;                              (let ((prev-time time))
;;                                (set! time (current-time))
;;                                (if (> click-separation-threshold-nanosec (time-to-nanosecond (time-difference time prev-time)))
;;                                    (set! count (+ count 1))
;;                                    (set! count 1)))))
;;     (xbindkey-function (cons 'release key) (lambda ()
;;                                              (let ((diff-time (time-to-nanosecond (time-difference (current-time) time))))
;;                                                (if (> click-separation-threshold-nanosec diff-time)
;;                                                    (call-with-new-thread (let ((start-time-count count))
;;                                                                            (lambda ()
;;                                                                              (usleep (/ (- click-separation-threshold-nanosec diff-time) 1000))
;;                                                                              (if (= count start-time-count)
;;                                                                                  (emit-command start-time-count commands-normal)))))
;;                                                    (when commands-long
;;                                                      (emit-command count commands-long))))))))

; mouse button gesture + single click and double click
;; (multi-click-key 'b:27 '((1 . (run-command "jumpapp firefox"))
;;                          (2 . (run-command "jumpapp /usr/local/emacs/bin/emacs28"))))
                 

; midle mouse button single click and double click
;; (multi-click-key 'b:12 '((1 . (run-command "jumpapp slack"))
;;                          (2 . (run-command "jumpapp kitty"))))


;; Thumb wheel
(xbindkey '(release "b:6") "xte 'keydown Super_L' 'keydown Page_Up' 'keyup Page_Up' 'keyup Super_L' 'sleep 10'")
(xbindkey '(release "b:7") "xte 'keydown Super_L' 'keydown Page_Down' 'keyup Page_Down' 'keyup Super_L' 'sleep 10'")
(xbindkey '(release "b:7") "xte 'keydown Super_L' 'keydown Right' 'keyup Right' 'keyup Super_L' 'sleep 10'")

;; mouse button gesture + left
;; (xbindkey '(release "b:28") "jumpapp firefox")
;; mouse button gesture + right
;; (xbindkey '(release "b:29") "jumpapp slack")
;; mouse button gesture + Down
;; (xbindkey '(release "b:30") "jumpapp google-chrome")
;; mouse button gesture + UP
;; (xbindkey '(release "b:31") "jumpapp evolution")


; (xbindkey '(mod4 shift "Return") "jumpapp -f  -i  emacs -- emacsclient -c")
; (xbindkey '(mod4 "Return") "jumpapp kitty")
;
; (xbindkey '(mod4 shift "h") "xdg-open ~/Downloads")
; (xbindkey '(mod4 shift "e") "splatmoji type")
;
; (xbindkey '(mod4 "Down") "wmctrl-resize-and-center")
; (xbindkey '(mod4 "Up") "wmctrl-resize-and-center rotate")
;
; (xbindkey '("Print") "flameshot gui")
; (xbindkey '(shift "Print") "gnome-screenshot -i")
; (xbindkey '("XF86Launch1") "mounch")
;

;; mouse button gesture + UP
;; (xbindkey '(release "b:31") "add-org-task")
;; (xbindkey '(release "b:31") "add-org-task")
;; (xbindkey '(control "b:31") "add-org-task selection")
;; (xbindkey '(mmod4 "b:31") "add-org-task link")
;; (xbindkey '(shift "b:31") "add-org-task jumpto")

;; (xbindkey '("F1") "add-org-task")
;; (xbindkey '(control "F1") "add-org-task jumpto")
;; (xbindkey '(shift "F1") "add-org-task selection")
;; (xbindkey '(shift "F6") "pastegg")
;; (xbindkey '(shift "F13") "jumpapp google-chrome")
;; (xbindkey '("Pause") "jumpapp spotify")
;; (xbindkey '("Scroll_Lock") "jumpapp -t \"^(Google Meet$|Meet$|Meet -)\" -i google-chrome /opt/google/chrome/google-chrome --profile-directory=Default --app-id=kjgfgldnnfoeklkmfkjfagphfepbbdan")
;; (xbindkey '(mod4 "space") "~/GIT/projects/mounch/mounch.py")
