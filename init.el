(package-initialize)
(add-to-list 'load-path "~/.emacs.d/lisp")


(require 'init-packages)
(require 'package)
(require 'init-keybindings)
(require 'custome)
(require 'init-ui)



(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(company-auto-complete (quote ignore))
 '(company-auto-complete-chars (quote (32 95 40 41 119 46 34 36 39 60 62 47 124 33)))
 '(company-global-modes t)
 '(company-show-numbers t)
 '(conda-anaconda-home "~/miniconda3")
 '(conda-env-home-directory "/home/houbowei/miniconda3/")
 '(custom-safe-themes
   (quote
    ("d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "a8245b7cc985a0610d71f9852e9f2767ad1b852c2bdea6f4aadc12cce9c4d6d0" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "a24c5b3c12d147da6cef80938dca1223b7c7f70f2f382b26308eba014dc4833a" default)))
 '(elpy-get-info-from-shell t)
 '(global-company-mode t)
 '(hl-sexp-background-color "#121212")
 '(package-selected-packages
   (quote
    (jedi py-autopep8 flycheck ein better-defaults material-theme anaconda-mode elpy)))
 '(python-indent-guess-indent-offset-verbose nil)
 '(yas-also-auto-indent-first-line t)
 '(yas-also-indent-empty-lines t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-tooltip ((t (:foreground "blue"))))
 '(highlight-indentation-face ((t (:inherit nil)))))


(package-initialize)
(elpy-enable)

(electric-indent-mode +1)
(setq inhibit-startup-message t) ;; hide the startup message
(load-theme 'material t) ;; load material theme
(global-linum-mode t) ;; enable line numbers globally
(menu-bar-mode 0)
