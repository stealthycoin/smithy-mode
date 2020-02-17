(provide 'smithy-mode)
(require 'generic-x)

(define-generic-mode
    'smithy-mode
  '("//")
  nil
  `(("namespace \\([a-zA-Z.]+\\)" 1 'font-lock-builtin-face)
    ("use \\([a-zA-Z.#]+\\)" 1 'font-lock-builtin-face)
    ("metadata \\([a-zA-Z][a-zA-Z0-9.]+ =\\)" 1 'font-lock-builtin-face)

    ("service \\([a-zA-Z]+\\)" 1 'font-lock-function-name-face)
    ("resource \\([a-zA-Z]+\\)" 1 'font-lock-function-name-face)
    ("string \\([a-zA-Z]+\\)" 1 'font-lock-function-name-face)
    ("operation \\([a-zA-Z]+\\)" 1 'font-lock-function-name-face)
    ("structure \\([a-zA-Z]+\\)" 1 'font-lock-function-name-face)
    ("list \\([a-zA-Z]+\\)" 1 'font-lock-function-name-face)
    ("map \\([a-zA-Z]+\\)" 1 'font-lock-function-name-face)
    ("apply \\([a-zA-Z]+\\)" 1 'font-lock-function-name-face)

    ("@[A-Za-z]+" . 'font-lock-type-face)

    ("true" . 'font-lock-constant-face)
    ("false" . 'font-lock-constant-face)
    ("null" . 'font-lock-constant-face)

    ("\\([a-zA-Z]+:\\)" 1 'font-lock-variable-name-face)

    ;; We define the keywords as a syntax rule after the unquoted dictionary
    ;; key syntax rule. Otherwise any dictionary that happens to have a key
    ;; name that collides with a smithy reserved word/keyword will have
    ;; incorrect keyword hilighting.
    (,(regexp-opt
       '("use" "namespace" "string"
         "operation" "structure"
         "list" "map" "apply" "metadata"
         "apply" "resource" "service")) . 'font-lock-keyword-face)
    )

  '("\\.smithy$")
  '((lambda () (modify-syntax-entry ?' "\""))
    )
  "A mode for smithy files"
  )
