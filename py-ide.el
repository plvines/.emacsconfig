;; Sourced from https://medium.com/analytics-vidhya/managing-a-python-development-environment-in-emacs-43897fd48c6a
(defun ssbb-pyenv-hook ()
"Automatically activates pyenv version if .python-version file exists."
(f-traverse-upwards
(lambda (path)
  (let ((pyenv-version-path (f-expand ".python-version" path)))
    (if (f-exists? pyenv-version-path)
        (pyenv-mode-set (s-trim (f-read-text pyenv-version-path 'utf-8))))))))

(add-hook 'find-file-hook 'ssbb-pyenv-hook)
; I'm using pyenv python so add shims path to exec-path
(add-to-list 'exec-path "~/.pyenv/shims")

(package-initialize)
(use-package elpy
    :straight t
    :bind
    (:map elpy-mode-map
          ("C-M-n" . elpy-nav-forward-block)
          ("C-M-p" . elpy-nav-backward-block))
    :hook ((elpy-mode . flycheck-mode)
           (pyenv-mode . elpy-rpc-restart))
    :init
    (elpy-enable)
    :config
    (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
    )
;; If a recursive load error occurs, do:
;; rm -r ~/.emacsconfig/straight/build/elpy
(setq elpy-rpc-backend "jedi")
(setq python-check-command (expand-file-name "/home/rook/.pyenv/shims/flake8"))
(setq python-check-command "flake8")

(setq elpy-rpc-virtualenv-path 'current)
(use-package company
  :straight t
  :diminish company-mode
  :init
  (global-company-mode)
  :config
  ;; set default `company-backends'
  (setq company-backends
        '((company-files          ; files & directory
           company-keywords       ; keywords
           company-capf)  ; completion-at-point-functions
          (company-abbrev company-dabbrev)
          ))
(use-package company-statistics
    :straight t
    :init
    (company-statistics-mode))
(use-package company-web
    :straight t)
(use-package company-try-hard
    :straight t
    :bind
    (("C-<tab>" . company-try-hard)
     :map company-active-map
     ("C-<tab>" . company-try-hard)))
(use-package company-quickhelp
    :straight t
    :config
    (company-quickhelp-mode))
)

(use-package buftra
    :straight (:host github :repo "humitos/buftra.el"))
(use-package py-pyment
    :straight (:host github :repo "humitos/py-cmd-buffer.el")
    :config
    (setq py-pyment-options '("--output=numpydoc")))
(use-package py-isort
    :straight (:host github :repo "humitos/py-cmd-buffer.el")
    :hook (python-mode . py-isort-enable-on-save)
    :config
    (setq py-isort-options '("--lines=88" "-m=3" "-tc" "-fgw=0" "-ca")))
(use-package py-autoflake
    :straight (:host github :repo "humitos/py-cmd-buffer.el")
    :hook (python-mode . py-autoflake-enable-on-save)
    :config
    (setq py-autoflake-options '("--expand-star-imports")))
(use-package py-docformatter
    :straight (:host github :repo "humitos/py-cmd-buffer.el")
    :hook (python-mode . py-docformatter-enable-on-save)
    :config
    (setq py-docformatter-options '("--wrap-summaries=88" "--pre-summary-newline")))
(use-package blacken
    :straight t
    :hook (python-mode . blacken-mode)
    :config
    (setq blacken-line-length '88))
(use-package python-docstring
    :straight t
    :hook (python-mode . python-docstring-mode))

(key-chord-define evil-normal-state-map " i" 'xref-find-references)
(key-chord-define evil-normal-state-map " u" 'xref-find-definitions-other-window)
(key-chord-define evil-normal-state-map " z" 'elpy-occur-definitions)
(key-chord-define evil-normal-state-map " 0" 'elpy-shell-send-statement-and-step)
(key-chord-define evil-normal-state-map " )" 'elpy-shell-send-statement-and-go)
(key-chord-define evil-normal-state-map " -" 'elpy-shell-send-region-or-buffer-and-go)
(key-chord-define evil-normal-state-map " f" 'elpy-format)

(require 'flycheck-mypy)
(add-hook 'python-mode-hook 'flycheck-mode)
(add-to-list 'flycheck-disabled-checkers 'python-flake8)
(add-to-list 'flycheck-disabled-checkers 'python-pylint)
