(defvar color1 "#886666")
(defvar color2 "#222222")

(setf
 stumpwm:*mode-line-background-color* color2 
 stumpwm:*mode-line-foreground-color* color1
 stumpwm:*mode-line-border-color* "#555555"
 stumpwm:*screen-mode-line-format* (list "%g | %v ^>^7 %B | " '(:eval (get-latence)) "ms %d    ")
 stumpwm:*mode-line-border-width* 1
 stumpwm:*mode-line-pad-x* 6
 stumpwm:*mode-line-pad-y* 1
stumpwm:*mode-line-timeout* 5
 stumpwm:*mouse-focus-policy* :click
 ;;stumpwm:*group-format* "%n·%t
 stumpwm:*group-format* "%n"
 stumpwm:*time-modeline-string* "%H:%M"
 stumpwm:*window-format* "^b^(:fg \"#7799AA\")<%25t>"
 stumpwm:*window-border-style* :tight
 stumpwm:*normal-border-width* 1)
(if (probe-file (data-dir-file "desktop.lisp"))
    (restore-from-file (data-dir-file "desktop.lisp")))
Undo And Redo Functionality
(load-module "winner-mode")
(define-key *root-map* (kbd "u") "winner-undo")
(define-key *root-map* (kbd "C-r") "winner-redo")
(add-hook *post-command-hook*
          (lambda (command)
            (when (member command winner-mode:*default-commands*)
              (winner-mode:dump-group-to-file))))

;;; Emacs integration
;; Treat emacs splits like Xorg windows
(defun is-emacs-p (win)
  "nil if the WIN"
  (when win
    (string-equal (window-class win) "Emacs")))

(defun exec-el (expression)
  "execute emacs lisp do not collect it's output"
  (run-shell-command (concat "emacsclient -e '" (write-to-string
                                                 expression) "'") nil))

(defun eval-string-as-el (expression)
  "evaluate a string as emacs lisp"
  (run-shell-command (concat "emacsclient -e '" expression "'") t))

(defun eval-el (expression)
  "evaluate emacs lisp and collect it's output"
  (eval-string-as-el (write-to-string expression)))

(defun emacs-winmove (direction)
  "executes the emacs function winmove-DIRECTION where DIRECTION is a string"
  (eval-string-as-el (concat "(windmove-" direction ")")))

(defun better-move-focus (ogdir)
  "Similar to move-focus but also treats emacs windows as Xorg windows"
  (let ((mv `(move-focus ,(intern (string ogdir) "KEYWORD"))))
    (if (is-emacs-p (current-window))
        (when
            ;; There is not emacs window in that direction
            (= (length (emacs-winmove
                        (string-downcase (string ogdir))))
               1)
          (eval mv))
        (eval mv))))

(defcommand my-mv (dir) ((:direction "Enter direction: "))
  (when dir
    (better-move-focus (string-upcase dir))))
