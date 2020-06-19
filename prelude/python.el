(elpy-enable)
(require 'lsp-mode)
(add-hook 'python-mode-hook #'lsp)
(add-hook 'elpy-mode-hook (lambda ()
                            (add-hook 'before-save-hook
                                      'elpy-black-fix-code nil t)))
