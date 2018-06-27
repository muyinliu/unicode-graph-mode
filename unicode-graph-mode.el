(require 'font-lock)

(defvar unicode-graph-face 'unicode-graph-face
  "Face name to use for Unicode Graph Mode.")

(defgroup unicode-graph-mode nil
  "Support for the Unicode Graph"
  :group 'languages
  :prefix "ug-")

(defface unicode-graph-face
  '((t (:inherit font-lock-keyword-face :family "Menlo" :foreground "Black")))
  "Face for Unicode Graph"
  :tag "unicode-graph-face"
  :group 'unicode-graph-mode)

(defface unicode-graph-rectangle-face
  '((t (:inherit font-lock-keyword-face :family "Menlo" :foreground "Blue")))
  "Face for Rectangle in Unicode Graph"
  :tag "unicode-graph-rectangle-face"
  :group 'unicode-graph-mode)

(defvar unicode-graph-font-lock-keywords
  `(("[┌─┐│└┄┄┘┬┴├┼┤]" . 'unicode-graph-rectangle-face)
    ("[ ─┄┄\n]\\(/\\)[ ─┄┄\n]" . (1 'unicode-graph-rectangle-face))
    ("[ ─┄┄\n]\\([\\]\\)[ ─┄┄\n]" . (1 'unicode-graph-rectangle-face))
    ("[ ─┄┄\n]\\(v\\)[ ─┄┄\n]" . (1 'unicode-graph-rectangle-face))
    ("[ ─┄┄\n]\\(\\^\\)[ ─┄┄\n]" . (1 'unicode-graph-rectangle-face))
    ("[ ─┄┄\n│]\\(<\\)[ ─┄┄\n]" . (1 'unicode-graph-rectangle-face))
    ("[ ─┄┄\n]\\(>\\)[ ─┄┄\n│]" . (1 'unicode-graph-rectangle-face))
    (,(rx anything) . 'unicode-graph-face)))

(defcustom unicode-graph-mode-hook nil
  "Hook run when entering Unicode Graph Mode"
  :type 'hook
  :tag "unicode-graph-mode-hook"
  :group 'unicode-graph-mode)

(define-derived-mode unicode-graph-mode text-mode "Unicode Graph"
  "Major mode for editing Unicode Graph files\(*.ug\)."
  :group 'unicode-graph-mode
  (setq-local font-lock-defaults
              '(unicode-graph-font-lock-keywords))
  (font-lock-add-keywords nil unicode-graph-font-lock-keywords)
  (run-mode-hooks 'unicode-graph-mode-hook))

(defalias 'ug-mode 'unicode-graph-mode)

(add-to-list 'auto-mode-alist '("\\.ug\\'" . unicode-graph-mode) t)

(provide 'unicode-graph-mode)
