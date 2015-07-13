(add-to-list 'load-path "~/.emacs.d/exec-path-from-shell/")
(require 'exec-path-from-shell)
(exec-path-from-shell-initialize)

(require 'desktop) (desktop-save-mode 1) (defun my-desktop-save ()
(interactive) ;; Don't call desktop-save-in-desktop-dir, as it prints message.  
(if (eq (desktop-owner) (emacs-pid)) (desktop-save desktop-dirname))) (add-hook 'auto-save-hook 'my-desktop-save)

(require 'ido)
(ido-mode t)

(add-to-list 'load-path "~/.emacs.d/auto-complete-1.3.1")
(require 'auto-complete)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
(require 'auto-complete-config)
(ac-config-default)
(global-auto-complete-mode t)

(add-to-list 'load-path "~/.emacs.d/")
(require 'fill-column-indicator)
(define-globalized-minor-mode
 global-fci-mode fci-mode (lambda () (fci-mode 1)))
(global-fci-mode t)

(add-to-list 'load-path "~/.emacs.d/ctable")
(require 'ctable)

;; JEDI things
;; (add-to-list 'load-path "~/.emacs.d/deferred")
;; (require 'deferred)
;; (require 'concurrent)
;; (add-to-list 'load-path "~/.emacs.d/epc")
;; (require 'epc)
;; (add-to-list 'load-path "~/.emacs.d/jedi")
;; (autoload 'jedi:setup "jedi" nil t)
;; (add-hook 'python-mode-hook 'jedi:setup)
;; (setq jedi:setup-keys t)                      ; optional
;; (setq jedi:complete-on-dot t)                 ; optional

(require 'lambda-mode)
(add-hook 'python-mode-hook #'lambda-mode 1)
(setq lambda-symbol (string (make-char 'greek-iso8859-7 107)))

(require 'autopair)
(autopair-global-mode t)

(add-to-list 'load-path "~/.emacs.d/dash")
(add-to-list 'load-path "~/.emacs.d/flycheck")
(require 'flycheck)
(require 'python-pylint)

(add-to-list 'load-path "~/.emacs.d/flycheck-tip")
(require `flycheck-tip)

(add-hook 'python-mode-hook 'flycheck-mode 1)
(auto-fill-mode 1)

(auto-revert-mode 1)

(load-file "~/.emacsconfig/ergo.el")
