(conda-env-initialize-interactive-shells)
;; if you want eshell support, include:
(conda-env-initialize-eshell)
;; if you want auto-activation (see below for details), include:
(conda-env-autoactivate-mode t)
(custom-set-variables
 '(conda-anaconda-home "~/anaconda3"))

;; set for elpy
(setq python-shell-interpreter "jupyter"
      python-shell-interpreter-args "console --simple-prompt"
      python-shell-prompt-detect-failure-warning nil)
(add-to-list 'python-shell-completion-native-disabled-interpreters
             "jupyter")

;; for autocompelete bracket.
(electric-pair-mode 1)
(setq electric-pair-preserve-balance nil)

;; Autocomplete for global
(add-hook 'after-init-hook 'global-company-mode)

(provide 'custome)
