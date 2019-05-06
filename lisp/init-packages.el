(setq url-proxy-services '(("no_proxy" . "work\\.com")
                           ("http" . "www-proxy.waseda.jp:8080")))
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
		    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "http")))
  ;; Comment/uncomment these two lines to enable/disable MELPA and MELPA Stable as desired
  (add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t)
  ;;(add-to-list 'package-archives (cons "melpa-stable" (concat proto "://stable.melpa.org/packages/")) t)
  (when (< emacs-major-version 24)
    ;; For important compatibility libraries like cl-lib
    (add-to-list 'package-archives '("gnu" . (concat proto "://elpa.gnu.org/packages/")))))
(package-refresh-contents)
(package-initialize)

(require 'cl)

;; Add Packages
(defvar myPackages '(
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
		      ;; --- Minor Mode ---
		      nodejs-repl
		      exec-path-from-shell
		      flycheck
		      projectile
      		      js2-mode
		      ;; --- Themes ---
		      monokai-theme
		      solarized-theme
		      material-theme
		      ;; --- Python ---
		      py-autopep8
		      elpy
		      conda
		      flycheck
		      ein
		      ;; --- C++ ---
		      ggtags
		      ) "Default packages")
(mapc #'(lambda (package)
    (unless (package-installed-p package)
      (package-install package)))
      myPackages)

(provide 'init-packages)
