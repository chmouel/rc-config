;; toggle hor/vert split (only with 2 windows)
;;rotate windows....
(defun shift-windows-forward (frames win)
  "Exchange windows through cycling frames."
  (when frames
    (let ((frame (car frames)))
      (shift-windows-forward (car frames)
                             (frame-window frame))
      (when win
        (pull-window win frame)))))
(defcommand rotate-windows () ()
  (let* ((frames (group-frames (current-group)))
         (win (frame-window (car (last frames)))))
    (shift-windows-forward frames win)))

(define-key *top-map* (kbd "s-]") "rotate-windows")

