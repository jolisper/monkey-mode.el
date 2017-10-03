(defvar monkey-mode-hook nil)

(defvar monkey-mode-map
  (let ((map (make-keymap)))
    (define-key map "C\j" 'newline-and-indent)
    map)
  "Keymap used for 'monkey-mode'.")

(defconst monkey-mode-keywords
  '("fn" "let" "if" "else" "return")
  "All keywords in the Monkey language. Used for font locking.")

(defconst monkey-mode-constants
  '("true" "false")
  "All constants in the Monkey language. Used for font locking.")

(defun monkey-build-font-lock ()
  (list
   `(,(concat "\\<" (regexp-opt monkey-mode-keywords t) "\\>") . font-lock-keyword-face)
   `(,(concat "\\<" (regexp-opt monkey-mode-constants t) "\\>") . font-lock-constant-face)
   ))

(defun monkey-mode ()
  "Major mode for editing Monkey language files."
  (interactive)
  (kill-all-local-variables)
  (use-local-map monkey-mode-map)
  (set (make-local-variable 'font-lock-defaults) '(monkey-build-font-lock))
  (setq major-mode 'monkey-mode)
  (setq mode-name "Monkey")
  (run-hooks 'monkey-mode-hook))

(provide 'monkey-mode)

