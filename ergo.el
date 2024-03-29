(windmove-default-keybindings 'super)

(require 'package) ;; You might already have this line
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/"))
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize) ;; You might already have this line
;(tool-bar-mode 0)
(show-paren-mode t)
(setq show-paren-style 'mixed)

(global-auto-revert-mode 1)
(add-hook 'org-mode-hook 'turn-on-auto-fill)
(add-hook 'org-mode-hook 'org-indent-mode)

(setq-default indent-tabs-mode nil)

;; (custom-set-variables
;;   ;; custom-set-variables was added by Custom.
;;   ;; If you edit it by hand, you could mess it up, so be careful.
;;   ;; Your init file should contain only one such instance.
;;   ;; If there is more than one, they won't work right.
;;  '(tab-stop-list (quote (4 8 12 16 20 24 28 32 36 40 44 48 52 56 60 64 68 72 76 80 84 88 92 96 100 104 108 112 116 120))))

(add-to-list 'load-path "~/.emacsconfig/evil")
(require 'evil)
(evil-mode 1)


;load a file named key-chord.el from some directory in the load-path (e.g. "~/.emacsconfig")
(use-package key-chord)

(key-chord-mode 1)
(key-chord-define-global "jk" 'evil-normal-state)

;; ====== RIGHT HAND =====

; forward-word-begin = l
(define-key evil-normal-state-map "l" 'forward-word)
(define-key evil-motion-state-map "l" 'forward-word)
(define-key evil-visual-state-map "l" 'forward-word)

; backword-word-end = h
(define-key evil-normal-state-map "h" 'backward-word)
(define-key evil-motion-state-map "h" 'backward-word)
(define-key evil-visual-state-map "h" 'backward-word)

; forward-char = o
(define-key evil-normal-state-map "o" 'evil-forward-char)
(define-key evil-motion-state-map "o" 'evil-forward-char)
(define-key evil-visual-state-map "o" 'evil-forward-char)


; backward-char = y
(define-key evil-normal-state-map "y" 'evil-backward-char)
(define-key evil-motion-state-map "y" 'evil-backward-char)
(define-key evil-visual-state-map "y" 'evil-backward-char)

; move next line = j
(define-key evil-normal-state-map "j" 'evil-next-line)
(define-key evil-motion-state-map "j" 'evil-next-line)
(define-key evil-visual-state-map "j" 'evil-next-line)

; move previous line = k
(define-key evil-normal-state-map "k" 'evil-previous-line)
(define-key evil-motion-state-map "k" 'evil-previous-line)
(define-key evil-visual-state-map "k" 'evil-previous-line)

; move half-screen up = m
(defun half-screen-up ()
                    (interactive)
                    (previous-line 10)
                    (evil-scroll-line-up 10)
                    )

(define-key evil-normal-state-map (kbd ",") 'evil-scroll-page-up)
(define-key evil-motion-state-map (kbd ",") 'evil-scroll-page-up)
(define-key evil-visual-state-map (kbd ",") 'evil-scroll-page-up)

(key-chord-define evil-normal-state-map " ," 'beginning-of-buffer)
(key-chord-define evil-normal-state-map " ," 'beginning-of-buffer)
(key-chord-define evil-normal-state-map " ," 'beginning-of-buffer)


; move half-screen down = ,
(defun half-screen-down ()
                    (interactive)
                    (next-line 10)
                    (evil-scroll-line-up 10)
                    )
(define-key evil-normal-state-map (kbd "m") 'evil-scroll-page-down)
(define-key evil-motion-state-map (kbd "m") 'evil-scroll-page-down)
(define-key evil-visual-state-map (kbd "m") 'evil-scroll-page-down)

(key-chord-define evil-normal-state-map " m" 'end-of-buffer)
(key-chord-define evil-normal-state-map " m" 'end-of-buffer)
(key-chord-define evil-normal-state-map " m" 'end-of-buffer)

; move to beginning of line = n
(define-key evil-normal-state-map (kbd "n") 'evil-beginning-of-line)
(define-key evil-motion-state-map (kbd "n") 'evil-beginning-of-line)
(define-key evil-visual-state-map (kbd "n") 'evil-beginning-of-line)

; move to end of line = .
(define-key evil-normal-state-map (kbd ".") 'evil-end-of-line)
(define-key evil-motion-state-map (kbd ".") 'evil-end-of-line)
(define-key evil-visual-state-map (kbd ".") 'evil-end-of-line)

; previous search item = u
(define-key evil-normal-state-map (kbd "u") 'evil-search-previous)
(define-key evil-motion-state-map (kbd "u") 'evil-search-previous)
(define-key evil-visual-state-map (kbd "u") 'evil-search-previous)

; next search item = i
(define-key evil-normal-state-map (kbd "i") 'evil-search-next)
(define-key evil-motion-state-map (kbd "i") 'evil-search-next)
(define-key evil-visual-state-map (kbd "i") 'evil-search-next)

; command = ;
;; (define-key evil-normal-state-map (kbd ";") 'execute-extended-command)
;; (define-key evil-motion-state-map (kbd ";") 'execute-extended-command)
;; (define-key evil-visual-state-map (kbd ";") 'execute-extended-command)
(key-chord-define evil-normal-state-map " ;" 'execute-extended-command)
(key-chord-define evil-motion-state-map " ;" 'execute-extended-command)
(key-chord-define evil-visual-state-map " ;" 'execute-extended-command)

; jump to matching delimiter
(key-chord-define evil-normal-state-map " [" 'backward-sexp)
(key-chord-define evil-motion-state-map " [" 'backward-sexp)
(key-chord-define evil-visual-state-map " [" 'backward-sexp)
(key-chord-define evil-normal-state-map " ]" 'forward-sexp)
(key-chord-define evil-motion-state-map " ]" 'forward-sexp)
(key-chord-define evil-visual-state-map " ]" 'forward-sexp)


; center at current line = SPC
; center at current line = ;
(define-key evil-normal-state-map (kbd ";") 'recenter-top-bottom)
(define-key evil-motion-state-map (kbd ";") 'recenter-top-bottom)

;; ====== LEFT HAND =====

; insert = s
(define-key evil-normal-state-map (kbd "s") 'evil-insert)
(define-key evil-motion-state-map (kbd "s") 'evil-insert)

; insert and new line

; change
(define-key evil-normal-state-map (kbd "c") 'evil-change)
(define-key evil-visual-state-map (kbd "c") 'evil-change)

;  append = f
(define-key evil-normal-state-map (kbd "f") 'evil-append)
(define-key evil-normal-state-map (kbd "f") 'evil-append)

; delete state = d
(define-key evil-normal-state-map (kbd "d") 'evil-delete)
(define-key evil-motion-state-map (kbd "d") 'evil-delete)

; delete line = d d
(define-key evil-operator-state-map (kbd "d") 'evil-line)

; insert at beginning = a
(define-key evil-normal-state-map (kbd "a") 'evil-insert-line)
(define-key evil-motion-state-map (kbd "a") 'evil-insert-line)

; append at end of line = g
(define-key evil-normal-state-map (kbd "g") 'evil-append-line)
(define-key evil-motion-state-map (kbd "g") 'evil-append-line)

; save region = w
(define-key evil-normal-state-map (kbd "w") 'kill-ring-save)
(define-key evil-motion-state-map (kbd "w") 'kill-ring-save)

; yank = e
(define-key evil-normal-state-map (kbd "e") 'evil-paste-before)
(define-key evil-motion-state-map (kbd "e") 'evil-paste-before)

; yank-pop
(key-chord-define evil-normal-state-map "er" 'yank-pop)
(key-chord-define evil-motion-state-map "er" 'yank-pop)

; kill region = q
(define-key evil-normal-state-map (kbd "q") 'kill-region)
(define-key evil-motion-state-map (kbd "q") 'kill-region)

; enter visual state = r
(define-key evil-normal-state-map (kbd "r") 'evil-visual-state)

; save buffer = z
(define-key evil-normal-state-map (kbd "z") 'save-buffer)
(define-key evil-motion-state-map (kbd "z") 'save-buffer)

; search backward = v-v
(key-chord-define evil-normal-state-map (kbd "vv") 'evil-search-backward)
(key-chord-define evil-visual-state-map (kbd "vv") 'evil-search-backward)

; search forward = v
(define-key evil-normal-state-map (kbd "v") 'evil-search-forward)
(define-key evil-visual-state-map (kbd "v") 'evil-search-forward)

; write file = w-r
(key-chord-define evil-normal-state-map "wr" 'write-file)
(key-chord-define evil-visual-state-map "wr" 'write-file)

; open file = q-r
(key-chord-define evil-normal-state-map "qr" 'find-file)
(key-chord-define evil-visual-state-map "qr" 'find-file)

; undo = I
(define-key evil-normal-state-map (kbd "I") 'undo)
(define-key evil-motion-state-map (kbd "I") 'undo)

; navigating windows
(key-chord-define evil-normal-state-map (kbd "jl") 'windmove-right)
(key-chord-define evil-normal-state-map (kbd "kh") 'windmove-left)
(key-chord-define evil-normal-state-map (kbd "hj") 'windmove-down)
(key-chord-define evil-normal-state-map (kbd "lk") 'windmove-up)
;; (global-set-key (kbd "C-l") 'windmove-right)
;; (global-set-key (kbd "C-h") 'windmove-left)
;; (global-set-key (kbd "C-j") 'windmove-down)
;; (global-set-key (kbd "C-k") 'windmove-up)

; repeat last macro = q-q
(key-chord-define evil-normal-state-map "qq" 'call-last-kbd-macro)
(key-chord-define evil-visual-state-map "qq" 'call-last-kbd-macro)

; make a macro = y-u
(key-chord-define evil-normal-state-map "yu" 'kmacro-start-macro)
(key-chord-define evil-visual-state-map "yu" 'kmacro-start-macro)

; end making a macro = i-o
(key-chord-define evil-normal-state-map "io" 'kmacro-end-macro)
(key-chord-define evil-visual-state-map "io" 'kmacro-end-macro)

; comment = x
(define-key evil-normal-state-map (kbd "x") 'comment-or-uncomment-region)

;; ; comment this line = xx
;; (defun comment-line (x)
;;   (interactive "shelp")
;;   (evil-beginning-of-line)
;;   (evil-visual-state)
;;   (evil-end-of-line)
;;   (comment-or-uncomment-region)
;;   (evil-normal-mode)
;; )
;; (key-chord-define evil-normal-state-map "xx" 'comment-line)

; indent
;; (define-key evil-normal-state-map (kbd "x") 'indent-for-tab-command)

; switch buffers = t
(define-key evil-normal-state-map (kbd "t") 'switch-to-buffer)

; open a shell and rename here = q-w
(defun open-shell-here (x)
                    (interactive "sEnter a name for the shell buffer: ")
                    (shell)
                    (rename-buffer x)
                    )
(define-key evil-normal-state-map (kbd "1") 'open-shell-here)
(define-key evil-visual-state-map (kbd "1") 'open-shell-here)

; kill this buffer = 1
(define-key evil-normal-state-map (kbd "2") 'kill-this-buffer)
(define-key evil-visual-state-map (kbd "2") 'kill-this-buffer)

; find & replace string = 2
(define-key evil-normal-state-map (kbd "3") 'query-replace)

; universal argument = 3
(define-key evil-normal-state-map (kbd "4") 'universal-argument)

; reformat paragraph
(key-chord-define evil-normal-state-map "zx" 'fill-paragraph)
(key-chord-define evil-visual-state-map "zx" 'fill-paragraph)

(key-chord-define evil-normal-state-map "iu" 'flycheck-tip-cycle)
(key-chord-define evil-motion-state-map "iu" 'flycheck-tip-cycle)

;; ===== INSERT =====
; type _ = space-space
;; (key-chord-define evil-insert-state-map "  " (kbd "_"))

;; === inserting/formatting (), [], and {}
(defun brackets  ()
  (interactive)
  (insert "[]")
  (backward-char 1)
  )
(defun parens  ()
  (interactive)
  (insert "()")
  (backward-char 1)
  )
(defun curlies  ()
  (interactive)
  (insert "{}")
  (backward-char 1)
  (newline 2)
  (indent-for-tab-command)
  (previous-line 1)
  (indent-for-tab-command)
  )
;(key-chord-define evil-insert-state-map "YU"  'parens)
;(key-chord-define evil-insert-state-map "UI"  'brackets)
;(key-chord-define evil-insert-state-map "IO"  'curlies)

(global-set-key (kbd "C-o") 'shrink-window-horizontally)
(global-set-key (kbd "C-p") 'enlarge-window-horizontally)

;; (define-key evil-normal-state-map (kbd "TAB") 'evil-undefine)
;; (defun evil-undefine ()
;;  (interactive)
;;  (let (evil-mode-map-alist)
;;    (call-interactively (key-binding (this-command-keys)))))


;; (load-file "~/.emacsconfig/go-hooks.el")

(global-set-key (kbd "C-0") 'compile)
