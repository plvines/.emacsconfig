(defun turn-buffer-modeline-green ()
  (set-face-foreground 'mode-line-inactive "white")
  (set-face-background 'mode-line-inactive "gray")
  (set-face-foreground 'mode-line "black")
  (set-face-background 'mode-line "green"))

(defun turn-buffer-modeline-black ()
  (set-face-foreground 'mode-line-inactive "white")
  (set-face-background 'mode-line-inactive "gray")
  (set-face-foreground 'mode-line "white")
  (set-face-background 'mode-line "black"))

(defun turn-buffer-modeline-blue ()
  (set-face-foreground 'mode-line-inactive "white")
  (set-face-background 'mode-line-inactive "gray")
  (set-face-foreground 'mode-line "black")
  (set-face-background 'mode-line "blue"))


(defun do--status-bar-change-mode-line-color()
  (cond
   ((memq evil-state '(hybrid insert emacs))
    (turn-buffer-modeline-green))
   ((memq evil-state '(visual))
    (turn-buffer-modeline-blue))
   (t (turn-buffer-modeline-black))))

(add-hook 'post-command-hook 'do--status-bar-change-mode-line-color)
(add-hook 'windmove-do-window-select 'do--status-bar-change-mode-line-color)
(add-hook 'find-file-hook 'do--status-bar-change-mode-line-color)

(defun dotemacs/user-config ()
  (add-hook 'evil-hybrid-state-entry-hook 'turn-buffer-modeline-green)
  (add-hook 'evil-hybrid-state-exit-hook 'turn-buffer-modeline-white))
