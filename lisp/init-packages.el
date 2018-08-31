(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
		    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "http")))
  ;; Comment/uncomment these two lines to enable/disable MELPA and MELPA Stable as desired
  (add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t)
  ;;(add-to-list 'package-archives (cons "melpa-stable" (concat proto "://stable.melpa.org/packages/")) t)
  (when (< emacs-major-version 24)
    ;; For important compatibility libraries like cl-lib
    (add-to-list 'package-archives '("gnu" . (concat proto "://elpa.gnu.org/packages/")))))
(package-initialize)

(require 'cl)

;; Add Packages
(defvar my/packages '(
		      ;; --- Auto-completion ---
		      company
		      ;;  Better Editor ---
		      better-defaults
		      hungry-delete
		      swiper
		      counsel
		      smartparens
		      popwin
		      recentf
		      smex
		      switch-window
		      highlight-symbol

		      ;; --- Major Mode ---
		      js2-mode
		      ;; --- Minor Mode ---
		      nodejs-repl
		      exec-path-from-shell
		      flycheck
		      projectile
		      ;; --- Themes ---
		      monokai-theme
		      solarized-theme		      
		      ;; --- Python ---
		      py-autopep8
		      conda
		      flycheck
		      ein
		      ) "Default packages")
(provide 'init-packages)
