;; Performance LSP
(setq gc-cons-threshold 100000000)
(setq read-process-output-max (* 1024 1024))
(setq lsp-ui-doc-enable nil)
(setq flx-ido-threshold 1000)

(custom-set-variables
 '(initial-frame-alist (quote ((fullscreen . maximized)))))

(prelude-require-packages '(ibuffer-projectile
                            ibuffer-vc
                            amx))
(use-package ivy-posframe
  :ensure t
  :init
  (setq ivy-posframe-display-functions-alist '((t . ivy-posframe-)))
  (setq ivy-posframe-display-functions-alist '((t . ivy-posframe-display-at-frame-center)))
  (setcdr (assq t ivy-format-functions-alist) #'ivy-format-function-line)
  (ivy-posframe-mode 1))
(use-package elpy
  :defer 2
  :ensure t)
(use-package company-box
  :defer 2
  :ensure t)
(use-package dired-icon
  :defer 2
  :ensure t)
(use-package emojify
  :defer 2
  :ensure t)
(use-package ivy-rich
  :defer 2
  :ensure t)
(use-package org-re-reveal
  :defer 2
  :ensure t)
(use-package evil-nerd-commenter
  :defer 2
  :ensure t)
(use-package counsel-projectile
  :defer 2
  :ensure t)
(use-package ag
  :defer 2
  :ensure t)
(use-package neotree
  :defer 2
  :ensure t)
(use-package flx
  :defer 2
  :ensure t)
(use-package yasnippet
  :defer 2
  :ensure t
  :init
  (yas-global-mode 1))
(use-package diff-hl
  :defer 2
  :ensure t)
(use-package diredfl
  :defer 2
  :ensure t)

;; Themes
(use-package hc-zenburn-theme
  :defer 2
  :ensure t)

(use-package color-theme-sanityinc-tomorrow
  :defer 2
  :ensure t)

(use-package hc-zenburn-theme
  :defer 2
  :ensure t)

(use-package all-the-icons
  :ensure t)

(use-package all-the-icons-dired
  :ensure t
  :defer 2
  :after (all-the-icons))

(use-package all-the-icons-ibuffer
  :ensure t
  :defer 2
  :after (all-the-icons))

(use-package ivy-rich
  :ensure t
  :config
  (ivy-rich-mode 1))

(use-package all-the-icons-ivy
  :ensure t
  :after (ivy-rich)
  :init
  (add-hook 'after-init-hook 'all-the-icons-ivy-setup)
  :config
  (setq all-the-icons-ivy-file-commands
      '(counsel-find-file counsel-file-jump counsel-recentf counsel-projectile-find-file counsel-projectile-find-dir projectile-find-file
                          projectile-find-dir projectile-completing-read))
  (counsel-projectile-mode)
  (all-the-icons-ivy-setup)
  (all-the-icons-ivy-rich-mode 1))

(use-package flyspell-lazy
  :ensure t
  :defer 2)
(use-package lsp-mode
  :defer 2
  :ensure t
  :init
  (add-hook 'web-mode-hook #'lsp)
  (add-hook 'typescript-mode-hook #'lsp))

(use-package emmet-mode
  :defer 2
  :ensure t
  :init
  (global-unset-key "\C-j")
  (global-set-key "\C-j" 'emmet-expand-line)
  (add-hook 'sgml-mode-hook 'emmet-mode)
  (add-hook 'css-mode-hook  'emmet-mode))

(use-package company-box
  :defer 1
  :ensure t
  :init
  (add-hook 'company-mode-hook 'company-box-mode))

(use-package prettier-js
  :defer 2
  :ensure t
  :init
  (add-hook 'web-mode-hook 'prettier-js-mode)
  (add-hook 'typescript-mode-hook 'prettier-js-mode))
;; Dashboard
(use-package dashboard
  :init
  (setq dashboard-banner-logo-title "Bem vindo mestre Vinícius!!!")
  (setq dashboard-center-content t)
  (setq dashboard-startup-banner "/home/thelink/Pictures/emacsV2.iconset/256x256.png")
  :config
  (dashboard-setup-startup-hook))

(use-package dashboard-hackernews
  :config
  (setq dashboard-items '((recents  . 5)
                          (bookmarks . 5)
                          (projects . 5)
                          (agenda . 5)
                          (hackernews . 5))))

;; Fix of icons in emacs client
(defun new-frame-setup (frame)
  (if (display-graphic-p frame)
      (setq neo-theme 'icons)))
;; Run for already-existing frames (For single instance emacs)
(mapc 'new-frame-setup (frame-list))
;; Run when a new frame is created (For emacs in client/server mode)
(add-hook 'after-make-frame-functions 'new-frame-setup)

;; Remove auto save
(setq prelude-format-on-save nil)

;; Remove ^M of the end of line
(defun no-junk-please-were-unixish ()
  (let ((coding-str (symbol-name buffer-file-coding-system)))
    (when (string-match "-\\(?:dos\\|mac\\)$" coding-str)
      (set-buffer-file-coding-system 'utf-8-unix))))

(add-hook 'find-file-hooks 'no-junk-please-were-unixish)

;; Company
;; (require 'company-box)

;; Fill Column
(setq fill-column 120)
(setq-default fill-column 120)

(scroll-bar-mode -1)

;; (global-set-key (kbd "s-g") #'magit-status)

(add-hook 'org-mode-hook (lambda () (org-superstar-mode 1)))
(add-hook 'dired-mode-hook 'all-the-icons-dired-mode)

(setq buffer-file-name nil)

;; Add maximized mode when open with emacsclient
(add-to-list 'default-frame-alist '(fullscreen . maximized))

;; Flyspell specifics
(setq flyspell-issue-message-flag nil)
(require 'flyspell-lazy)
	(flyspell-lazy-mode 1)

;; Specifics when open emacs on emacsclient
(if (< (length command-line-args) 2)
    (setq initial-buffer-choice (lambda () (get-buffer "*dashboard*"))))

;; Tide mode
(add-hook 'tide-mode-hook
          (lambda ()
            (local-set-key (kbd "C-c C-t f") 'tide-format)
            (local-set-key (kbd "C-c C-t h") 'tide-documentation-at-point)
            (local-set-key (kbd "C-c C-t r") 'tide-rename-symbol)
            (local-set-key (kbd "C-c C-t i") 'tide-organize-imports)))

;; Evil Configuration
(require 'evil)
;; remove all keybindings from insert-state keymap
(define-key evil-insert-state-map [escape] 'evil-normal-state)
(define-key evil-normal-state-map (kbd "C-u") 'evil-scroll-up)
(define-key evil-normal-state-map (kbd "[ m") 'beginning-of-defun)
(define-key evil-normal-state-map (kbd "] m") 'end-of-defun)
(define-key evil-normal-state-map (kbd "k") 'evil-previous-visual-line)
(define-key evil-normal-state-map (kbd "j") 'evil-next-visual-line)

(evil-mode t)
(setq evil-jumps-cross-buffers nil) ;; for C-o and C-i to not cross buffers
(provide 'emvil)
(require 'evil-collection)
(evil-collection-init)
(define-key evil-normal-state-map (kbd "SPC") (general-simulate-key "C-x"))
(define-key evil-visual-state-map (kbd "SPC") (general-simulate-key "C-x"))
(define-key evil-normal-state-map (kbd ",") (general-simulate-key "C-c"))
(define-key evil-visual-state-map (kbd ",") (general-simulate-key "C-c"))
(key-chord-define evil-insert-state-map "jk" 'evil-normal-state)

;; General
(general-define-key :keymaps 'evil-insert-state-map
                    (general-chord "jk") 'evil-normal-state
                    (general-chord "kj") 'evil-normal-state)
(general-define-key
 :states '(normal visual motion)
  "gc" 'evilnc-comment-or-uncomment-lines
  "gs" 'evil-avy-goto-char-2
  "gl" 'evil-avy-goto-line
  "C-e" 'end-of-line
  "C-a" 'crux-move-beginning-of-line)
(general-define-key
 :states 'insert
 "C-e" 'end-of-line
 "C-a" 'crux-move-beginning-of-line)
(general-unbind 'insert
  "C-n"
  "C-p")
(general-define-key
 "C-x f" 'counsel-find-file
 "C-x c" 'save-buffers-kill-emacs
 "C-x C-d" 'dired
 "s-g" 'magit-status
 "C-c m n" 'mc/mark-next-like-this-symbol
 "C-c m p" 'mc/mark-previous-like-this-symbol
 "C-c m b" 'mc/edit-beginnings-of-lines
 "C-c m e" 'mc/edit-ends-of-lines
 "C-c m m" 'mc/mark-next-like-this
 "C-c m c" 'mc/edit-lines)

(use-package evil-magit
  :ensure t)
(use-package evil-snipe
  :ensure t
  :config
  (evil-snipe-mode +1)
  (evil-snipe-override-mode +1))
(use-package evil-surround
  :ensure t
  :config
  (global-evil-surround-mode 1))
(use-package org-evil
  :ensure t)

;; Evil specifics
(setq evil-emacs-state-modes nil)
(setq evil-insert-state-modes nil)
(setq evil-motion-state-modes nil)

;; Key Chord
(key-chord-define-global "jj" nil)
(key-chord-define-global "jk" nil)
(key-chord-define-global "jl" nil)
(key-chord-define-global "uu" nil)
(key-chord-define-global "yy" nil)
(key-chord-define-global "jw" 'evil-avy-goto-char-2)

;; Company resolution
(define-key company-active-map (kbd "RET") 'company-complete-selection)
