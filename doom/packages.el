;; -*- no-byte-compile: t; -*-
;;; .doom.d/packages.el

;;; Examples:
;; (package! some-package)
;; (package! another-package :recipe (:host github :repo "username/repo"))
;; (package! builtin-package :disable t)
(package! all-the-icons)
(package! avy)
(package! company-lsp)
(package! elpy)
(package! emmet-mode)
(package! flymake-jslint)
(package! go)
(package! helm-css-scss)
(package! helm-emmet)
(package! helm-go-package)
(package! js2-mode)
(package! js2-refactor)
(package! minesweeper)
(package! moe-theme)
(package! org-super-agenda)
(package! powerline)
(package! py-autopep8)
(package! treemacs-icons-dired)
(package! treemacs-projectile)
(package! tide)
(package! add-node-modules-path)
(package! wttrin :recipe (:host github :repo "bcbcarl/emacs-wttrin"))

;; Disable Packages
(package! highlight-indentation :disable t)
;; (package! hl-fill-column :disable t)