(load-theme 'material t)
(conda-env-initialize-interactive-shells)
;; if you want eshell support, include:
(conda-env-initialize-eshell)
;; if you want auto-activation (see below for details), include:
(conda-env-autoactivate-mode t)
(custom-set-variables
 '(conda-anaconda-home "~/miniconda3"))

;; set for elpy
(setq elpy-rpc-backend "jedi")
(add-hook 'elpy-mode-hook 'flycheck-mode)
(require 'py-autopep8)
(add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)


(setq python-shell-interpreter "ipython"
      python-shell-interpreter-args "-i --simple-prompt")
;; ;; jedi
;; (add-hook 'python-mode-hook 'jedi:setup)
;; (setq jedi:complete-on-dot t)                 ; optional

;; for autocompelete bracket.
(electric-pair-mode 1)
(setq electric-pair-preserve-balance nil)

;; Autocomplete for global
(add-hook 'after-init-hook 'global-company-mode)

;; Say yes or no
(defalias 'yes-or-no-p 'y-or-n-p)

;; Window split
(global-set-key "\C-x2" (lambda () (interactive)(split-window-vertically) (other-window 1)))
(global-set-key "\C-x3" (lambda () (interactive)(split-window-horizontally) (other-window 1)))

;; Org-python
(org-babel-do-load-languages
 'org-babel-load-languages
 '((python . t)))

;; irony for cpp
(add-hook 'c++-mode-hook 'irony-mode)
(add-hook 'c-mode-hook 'irony-mode)
(add-hook 'objc-mode-hook 'irony-mode)

(add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)

;; ggtags for C++
;; (require 'ggtags)
;; (add-hook 'c-mode-common-hook
;;           (lambda ()
;;             (when (derived-mode-p 'c-mode 'c++-mode 'java-mode 'asm-mode)
;;               (ggtags-mode 1))))

;; (define-key ggtags-mode-map (kbd "C-c g s") 'ggtags-find-other-symbol)
;; (define-key ggtags-mode-map (kbd "C-c g h") 'ggtags-view-tag-history)
;; (define-key ggtags-mode-map (kbd "C-c g r") 'ggtags-find-reference)
;; (define-key ggtags-mode-map (kbd "C-c g f") 'ggtags-find-file)
;; (define-key ggtags-mode-map (kbd "C-c g c") 'ggtags-create-tags)
;; (define-key ggtags-mode-map (kbd "C-c g u") 'ggtags-update-tags)

;; (define-key ggtags-mode-map (kbd "M-,") 'pop-tag-mark)

;; gdb mode
;; Show main source buffer when using GDB
(setq gdb-show-main t)

;; show paren mode
(show-paren-mode 1)
(setq show-paren-delay 0)

;; universal code folding for hideshow
(defun toggle-selective-display (column)
      (interactive "P")
      (set-selective-display
       (or column
           (unless selective-display
             (1+ (current-column))))))
(defun toggle-hiding (column)
      (interactive "P")
      (if hs-minor-mode
          (if (condition-case nil
                  (hs-toggle-hiding)
                (error t))
              (hs-show-all))
        (toggle-selective-display column)))
(load-library "hideshow")
(global-set-key (kbd "C-+") 'toggle-hiding)
(global-set-key (kbd "C-\\") 'toggle-selective-display)
(add-hook 'c-mode-common-hook   'hs-minor-mode)
(add-hook 'emacs-lisp-mode-hook 'hs-minor-mode)
(add-hook 'java-mode-hook       'hs-minor-mode)
(add-hook 'lisp-mode-hook       'hs-minor-mode)
(add-hook 'perl-mode-hook       'hs-minor-mode)
(add-hook 'sh-mode-hook         'hs-minor-mode)

;; org mode
(setq org-startup-with-inline-images t)
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-cb" 'org-switchb)

;; smex mode conflict with c-h
(define-key key-translation-map [?\C-h] [?\C-?])

;; savedesk
(desktop-save-mode 1)

;; autosave more frequently
(setq auto-save-interval 20)
(setq auto-save-timeout 3)
(setq auto-save-visited-mode t)


(provide 'custome)
