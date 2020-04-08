(package-refresh-contents)
(package-install 'use-package)
(require 'use-package)

(use-package desktop) (desktop-save-mode 1) (defun my-desktop-save ()
(interactive) ;; Don't call desktop-save-in-desktop-dir, as it prints message.  
(if (eq (desktop-owner) (emacs-pid)) (desktop-save desktop-dirname))) (add-hook 'auto-save-hook 'my-desktop-save)

(use-package ido)
(ido-mode t)

(add-to-list 'load-path "~/.emacs.d/auto-complete-1.3.1")
(use-package auto-complete)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
(use-package auto-complete-config)
(ac-config-default)
(global-auto-complete-mode t)

(add-to-list 'load-path "~/.emacs.d/")
(use-package fill-column-indicator)
(define-globalized-minor-mode
 global-fci-mode fci-mode (lambda () (fci-mode 1)))
(global-fci-mode t)

(add-to-list 'load-path "~/.emacs.d/ctable")
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

(add-to-list 'load-path "~/.emacs.d/dash")
(add-to-list 'load-path "~/.emacs.d/flycheck")
(use-package flycheck)

(add-to-list 'load-path "~/.emacs.d/flycheck-tip")
(require `flycheck-tip)

(add-hook 'python-mode-hook 'flycheck-mode 1)
(auto-fill-mode 1)

(auto-revert-mode 1)

(load "~/.emacsconfig/modeline.el")
