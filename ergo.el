(windmove-default-keybindings 'super)

(tool-bar-mode 0)
(show-paren-mode t)
(setq show-paren-style 'mixed)

(global-auto-revert-mode 1)
(add-hook 'org-mode-hook 'turn-on-auto-fill)
(add-hook 'org-mode-hook 'org-indent-mode)

(setq-default indent-tabs-mode nil)

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(tab-stop-list (quote (4 8 12 16 20 24 28 32 36 40 44 48 52 56 60 64 68 72 76 80 84 88 92 96 100 104 108 112 116 120))))

(add-to-list 'load-path "~/.emacsconfig/evil")
(require 'evil)
(evil-mode 1)


;load a file named key-chord.el from some directory in the load-path (e.g. "~/.emacsconfig")
(add-to-list 'load-path "~/.emacsconfig/")
(require 'key-chord)
(key-chord-mode 1)
(key-chord-define-global "jk" 'evil-normal-state)

;; ====== RIGHT HAND =====

; forward-word-begin = l
(define-key evil-normal-state-map "l" 'evil-forward-WORD-begin)
(define-key evil-motion-state-map "l" 'evil-forward-WORD-begin)
(define-key evil-visual-state-map "l" 'evil-forward-WORD-begin)

; backword-word-end = h
(define-key evil-normal-state-map "h" 'evil-backward-WORD-end)
(define-key evil-motion-state-map "h" 'evil-backward-WORD-end)
(define-key evil-visual-state-map "h" 'evil-backward-WORD-end)

; forward-char = o
(define-key evil-normal-state-map "o" 'evil-forward-char)
(define-key evil-motion-state-map "o" 'evil-forward-char)
(define-key evil-visual-state-map "o" 'evil-forward-char)


; backward-char = y
(define-key evil-normal-state-map "y" 'evil-backward-char)
(define-key evil-motion-state-map "y" 'evil-backward-char)
(define-key evil-visual-state-map "y" 'evil-backward-char)

; move next line = k
(define-key evil-normal-state-map "k" 'evil-next-line)
(define-key evil-motion-state-map "k" 'evil-next-line)
(define-key evil-visual-state-map "k" 'evil-next-line)

; move previous line = j
(define-key evil-normal-state-map "j" 'evil-previous-line)
(define-key evil-motion-state-map "j" 'evil-previous-line)
(define-key evil-visual-state-map "j" 'evil-previous-line)

; move half-screen up = m
(defun half-screen-up ()
                    (interactive)
                    (previous-line 10)
                    (evil-scroll-line-up 10)
                    )

(define-key evil-normal-state-map (kbd "m") 'evil-scroll-page-up)
(define-key evil-motion-state-map (kbd "m") 'evil-scroll-page-up)
(define-key evil-visual-state-map (kbd "m") 'evil-scroll-page-up)

; move half-screen down = ,
(defun half-screen-down ()
                    (interactive)
                    (next-line 10)
                    (evil-scroll-line-up 10)
                    )
(define-key evil-normal-state-map (kbd ",") 'evil-scroll-page-down)
(define-key evil-motion-state-map (kbd ",") 'evil-scroll-page-down)
(define-key evil-visual-state-map (kbd ",") 'evil-scroll-page-down)

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
(define-key evil-normal-state-map (kbd ";") 'execute-extended-command)
(define-key evil-motion-state-map (kbd ";") 'execute-extended-command)
(define-key evil-visual-state-map (kbd ";") 'execute-extended-command)

; center at current line = SPC
(define-key evil-normal-state-map (kbd "SPC") 'recenter-top-bottom)
(define-key evil-motion-state-map (kbd "SPC") 'recenter-top-bottom)

;; ====== LEFT HAND =====

; insert = s
(define-key evil-normal-state-map (kbd "s") 'evil-insert)
(define-key evil-motion-state-map (kbd "s") 'evil-insert)

; delete state = d
(define-key evil-normal-state-map (kbd "d") 'evil-delete)
(define-key evil-motion-state-map (kbd "d") 'evil-delete)

; delete line = d d
(define-key evil-operator-state-map (kbd "d") 'evil-line)

; insert at beginning = a
(define-key evil-normal-state-map (kbd "a") 'evil-insert-line)
(define-key evil-motion-state-map (kbd "a") 'evil-insert-line)

; append at end of line = f
(define-key evil-normal-state-map (kbd "f") 'evil-append-line)
(define-key evil-motion-state-map (kbd "f") 'evil-append-line)

; save region = w
(define-key evil-normal-state-map (kbd "w") 'kill-ring-save)
(define-key evil-motion-state-map (kbd "w") 'kill-ring-save)

; yank = e
(define-key evil-normal-state-map (kbd "e") 'yank)
(define-key evil-motion-state-map (kbd "e") 'yank)

; kill region = q
(define-key evil-normal-state-map (kbd "q") 'kill-region)
(define-key evil-motion-state-map (kbd "q") 'kill-region)

; enter visual state = r
(define-key evil-normal-state-map (kbd "r") 'evil-visual-state)

; replace = z 
(define-key evil-normal-state-map (kbd "z") 'evil-replace-state)
(define-key evil-motion-state-map (kbd "z") 'evil-replace-state)

; search backward = v-v
(key-chord-define evil-normal-state-map (kbd "vv") 'evil-search-backward)
(key-chord-define evil-visual-state-map (kbd "vv") 'evil-search-backward)

; search forward = v
(define-key evil-normal-state-map (kbd "v") 'evil-search-forward)
(define-key evil-visual-state-map (kbd "v") 'evil-search-forward)

; save buffer = w-e
(key-chord-define evil-normal-state-map "we" 'save-some-buffers)
(key-chord-define evil-visual-state-map "we" 'save-some-buffers)

; write file = w-r
(key-chord-define evil-normal-state-map "wr" 'write-file)
(key-chord-define evil-visual-state-map "wr" 'write-file)

; open file = q-r
(key-chord-define evil-normal-state-map "qr" 'find-file)
(key-chord-define evil-visual-state-map "qr" 'find-file)

; undo = hl or I
(key-chord-define evil-normal-state-map "hl" 'undo)
(define-key evil-normal-state-map (kbd "I") 'undo)
(define-key evil-motion-state-map (kbd "I") 'undo)

; navigating windows 
(global-set-key (kbd "C-l") 'windmove-right)
(global-set-key (kbd "C-h") 'windmove-left)
(global-set-key (kbd "C-j") 'windmove-up)
(global-set-key (kbd "C-k") 'windmove-down)


; insert pairs of (), [], {}

; repeat last macro = q-q
(key-chord-define evil-normal-state-map "qq" 'call-last-kbd-macro)
(key-chord-define evil-visual-state-map "qq" 'call-last-kbd-macro)

; make a macro = y-u
(key-chord-define evil-normal-state-map "yu" 'kmacro-start-macro)
(key-chord-define evil-visual-state-map "yu" 'kmacro-start-macro)

; end making a macro = i-o
(key-chord-define evil-normal-state-map "io" 'kmacro-end-macro)
(key-chord-define evil-visual-state-map "io" 'kmacro-end-macro)

; comment = c
(define-key evil-normal-state-map (kbd "c") 'comment-or-uncomment-region)

; indent = x
(define-key evil-normal-state-map (kbd "x") 'indent-for-tab-command)

; switch buffers = t
(define-key evil-normal-state-map (kbd "t") 'switch-to-buffer)

; open a shell and rename here = q-w
(defun open-shell-here (x)
                    (interactive "sEnter a name for the shell buffer: ")
                    (shell)
                    (rename-buffer x)
                    )
(define-key evil-normal-state-map (kbd "`") 'open-shell-here)
(define-key evil-visual-state-map (kbd "`") 'open-shell-here)

; kill this buffer = 1
(define-key evil-normal-state-map (kbd "1") 'kill-this-buffer)
(define-key evil-visual-state-map (kbd "1") 'kill-this-buffer)

; find & replace string = 2
(define-key evil-normal-state-map (kbd "2") 'query-replace)

; universal argument = 3
(define-key evil-normal-state-map (kbd "3") 'universal-argument)

; reformat paragraph
(key-chord-define evil-normal-state-map "zx" 'fill-paragraph)
(key-chord-define evil-visual-state-map "zx" 'fill-paragraph)


;; ===== INSERT =====
; type _ = space-space
(key-chord-define evil-insert-state-map "  " (kbd "_"))

;; === inserting/formatting (), [], and {}
(defun brackets  ()
  (interactive)
  (insert "[]")
  (left-char 1)
  )
(defun parens  ()
  (interactive)
  (insert "()")
  (left-char 1)
  )
(defun curlies  ()
  (interactive)
  (insert "{}")
  (left-char 1)
  (newline 2)
  (indent-for-tab-command)
  (previous-line 1)
  (indent-for-tab-command)
  )
(key-chord-define evil-insert-state-map "YU"  'parens)
(key-chord-define evil-insert-state-map "UI"  'brackets)
(key-chord-define evil-insert-state-map "IO"  'curlies)

(global-set-key (kbd "C-o") 'shrink-window-horizontally)
(global-set-key (kbd "C-p") 'enlarge-window-horizontally)

;; (define-key evil-normal-state-map (kbd "TAB") 'evil-undefine)
;; (defun evil-undefine ()
;;  (interactive)
;;  (let (evil-mode-map-alist)
;;    (call-interactively (key-binding (this-command-keys)))))

