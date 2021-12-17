(load-module "globalwindows")
(define-key *top-map* (kbd "s-\\") "global-windowlist")

(load-module "clipboard-history")
(define-key *root-map* (kbd "C-y") "show-clipboard-history")
(clipboard-history:start-clipboard-manager)

(load-module "pass")
