(package-initialize)

;; (package-initialize) should already exist at the top of the init
;; file on Debian-derived systems, thus (elpy-enable) should be all
;; that is required.

(add-to-list 'load-path "~/.emacs.d/lisp/")

;; Package Management
;; -----------------------------------------------------------------
(require 'init-packages)
(require 'package)
(require 'init-keybindings)
(require 'custome)
(require 'init-ui)

;; elpy
(elpy-enable)

;; flycheck
(when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))

(add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)

(projectile-mode +1)
(define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(conda-anaconda-home "~/anaconda3")
 '(custom-safe-themes
   (quote
    ("d1ede12c09296a84d007ef121cd72061c2c6722fcb02cb50a77d9eae4138a3ff" "aaffceb9b0f539b6ad6becb8e96a04f2140c8faa1de8039a343a4f1e009174fb" default)))
 '(package-selected-packages
   (quote
    (markdown-mode yasnippet-snippets yasnippet-classic-snippets switch-window solarized-theme smex smartparens py-autopep8 projectile popwin nodejs-repl neotree monokai-theme monokai-alt-theme jedi hungry-delete highlight-symbol flycheck exec-path-from-shell elpy ein dracula-theme counsel conda company-jedi company-anaconda))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
