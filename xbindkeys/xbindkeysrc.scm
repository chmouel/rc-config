;; Thumb wheel
(xbindkey '(release "b:6") "xte 'keydown Alt_L' 'keydown Left' 'keyup Left' 'keyup Alt_L' 'sleep 10'")
(xbindkey '(release "b:7") "xte 'keydown Alt_L' 'keydown Right' 'keyup Right' 'keyup Alt_L' 'sleep 10'")

;; mouse button gesture + left
;; (xbindkey '(release "b:28") "jumpapp firefox")
;; mouse button gesture + right
(xbindkey '("XF86Launch5") "jumpapp slack")
(xbindkey '("XF86Launch9") "jumpapp -f -i emacs -- emacs -c -a emacs")
(xbindkey '("XF86launch8") "jumpapp kitty")
(xbindkey '("XF86launch6") "jumpapp firefox")
(xbindkey '("XF86launch7") "jumpapp chromium")

(xbindkey '(mod4 "s") "jumpapp slack")
(xbindkey '(mod4 "e") "jumpapp -f -i emacs -- emacsclient -c -a emacs")
(xbindkey '(mod4 "Return") "jumpapp kitty")
(xbindkey '(mod4 "f") "jumpapp firefox")
(xbindkey '(mod4 "w") "jumpapp chromium")
(xbindkey '(mod4 "m") "jumpapp spotify")

(xbindkey '(mod4 shift "space") "gpaste-client ui")
(xbindkey '(mod4 control "e") "splatmoji copy")
(xbindkey '(mod4 shift "e") "emacsclient -c -n -a emacs")


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
