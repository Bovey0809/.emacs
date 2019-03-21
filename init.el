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

;; ido mode
(setq ido-enable-flex-matching t)
(setq ido-use-filename-at-point 'guess)
(setq ido-everywhere t)          
(ido-mode 1)


;;c++mode
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))
(require 'cl)

(defun file-in-directory-list-p (file dirlist)
  "Returns true if the file specified is contained within one of
the directories in the list. The directories must also exist."
  (let ((dirs (mapcar 'expand-file-name dirlist))
        (filedir (expand-file-name (file-name-directory file))))
    (and
     (file-directory-p filedir)
     (member-if (lambda (x) ; Check directory prefix matches
                  (string-match (substring x 0 (min(length filedir) (length x))) filedir))
                dirs))))

(defun buffer-standard-include-p ()
  "Returns true if the current buffer is contained within one of
the directories in the INCLUDE environment variable."
  (and (getenv "INCLUDE")
       (file-in-directory-list-p buffer-file-name (split-string (getenv "INCLUDE") path-separator))))

(add-to-list 'magic-fallback-mode-alist '(buffer-standard-include-p . c++-mode))


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
    ("8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "ad9bbd248fa223436c71b87d80086c9e567b2e32e02bf0ccc90beb038cdbcea7" "d1ede12c09296a84d007ef121cd72061c2c6722fcb02cb50a77d9eae4138a3ff" "aaffceb9b0f539b6ad6becb8e96a04f2140c8faa1de8039a343a4f1e009174fb" default)))
 '(package-selected-packages
   (quote
    (irony-eldoc ## company-irony ggtags markdown-mode yasnippet-snippets yasnippet-classic-snippets switch-window solarized-theme smex smartparens py-autopep8 projectile popwin nodejs-repl neotree monokai-theme monokai-alt-theme jedi hungry-delete highlight-symbol flycheck exec-path-from-shell elpy ein dracula-theme counsel conda company-jedi company-anaconda))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
