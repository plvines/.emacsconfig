(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(use-package projectile)

;; Bootstrap 'use-package'
(eval-after-load 'gnutls
  '(add-to-list 'gnutls-trustfiles "/etc/ssl/cert.pem"))
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(eval-when-compile
  (require 'use-package))
(require 'bind-key)
(setq use-package-always-ensure t)

(load "~/.emacsconfig/ergo.el")

;; Loads straight.el
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(use-package f)
(use-package s)
(use-package dash)

(use-package desktop) (desktop-save-mode 1) (defun my-desktop-save ()
(interactive) ;; Don't call desktop-save-in-desktop-dir, as it prints message.
(if (eq (desktop-owner) (emacs-pid)) (desktop-save desktop-dirname))) (add-hook 'auto-save-hook 'my-desktop-save)

(use-package ido)
(ido-mode t)

; only type y instead of yes
(fset 'yes-or-no-p 'y-or-n-p)

; highlight current line
(global-hl-line-mode 1)

(use-package auto-complete)
(global-auto-complete-mode t)

(use-package fill-column-indicator)
(define-globalized-minor-mode
 global-fci-mode fci-mode (lambda () (fci-mode 1)))
(global-fci-mode t)

(use-package ctable)

;; JEDI things
;; (add-to-list 'load-path "~/.emacs.d/deferred")
;; (use-package deferred)
;; (use-package concurrent)
;; (add-to-list 'load-path "~/.emacs.d/epc")
;; (use-package epc)
;; (add-to-list 'load-path "~/.emacs.d/jedi")
;; (autoload 'jedi:setup "jedi" nil t)
;; (add-hook 'python-mode-hook 'jedi:setup)
;; (setq jedi:setup-keys t)                      ; optional
;; (setq jedi:complete-on-dot t)                 ; optional

;; (use-package pretty-lambdada)

(use-package flycheck)

(use-package flycheck-tip)

(auto-fill-mode 1)

(auto-revert-mode 1)

(load "~/.emacsconfig/modeline.el")

(load "~/.emacsconfig/py-ide.el")
; (use-package 'go-mode-load)
