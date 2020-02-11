;;; .doom.d/config.el -*- lexical-binding: t; -*-

(custom-set-variables
 '(initial-frame-alist (quote ((fullscreen . maximized)))))

;; Shortcuts or global keys
(map! [f8] #'neotree-toggle)
(map! [f9] #'wttrin)
(setq doom-localleader-key ",")

;; Python config
(elpy-enable)

;; Org Config
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
(setq org-log-done 'time)

;; Theme
(setq doom-theme 'doom-tomorrow-night)
;; (setq doom-theme 'doom-molokai)

(require 'powerline)
(show-paren-mode t)
(setq show-paren-style 'expression)

;; Personal Configurations
(setq display-line-numbers-type nil)
(setq wttrin-default-cities '("Florianópolis" "São Paulo" "Ribeirão Preto"))

;; Avy specifics
(map! [f5] #'avy-goto-char-2)
(map! "C-;" #'avy-goto-char-2)

;; Go Specifics language
(add-to-list 'exec-path "/user/local/go/bin")
(add-hook 'before-save-hook 'gofmt-before-save)
(defun auto-complete-for-go ()
(auto-complete-mode 1))
 (add-hook 'go-mode-hook 'auto-complete-for-go)
;; Go keybindings
(defun go-mode-setup ()
  (go-eldoc-setup))

(add-hook 'go-mode-hook 'go-mode-setup)

(setq elpy-rpc-virtualenv-path 'current)

;; Set Font
;; (setq doom-font (font-spec :family "Hack" :size 16))
(setq doom-font (font-spec :family "JetBrains Mono" :size 18))

(custom-set-variables
 '(org-directory "~/Documents")
 '(org-agenda-files (list org-directory)))

(map! "C-j" #'emmet-expand-line)

(autoload 'tern-mode "tern.el" nil t)
(add-hook 'js-mode-hook (lambda () (tern-mode t)))
(add-hook 'js-mode-hook (lambda () (auto-complete-mode t)))
(eval-after-load 'tern
   '(progn
      (require 'tern-auto-complete)
      (tern-ac-setup)))
(setenv "PATH" (concat "/usr/bin:" (getenv "PATH")))

;; Set neotree theme
(setq neo-theme (if (display-graphic-p) 'icons 'arrow))

;; Change ibuffer behavior
(map! :g "C-x C-b" 'ibuffer)

;; How tall the mode-line should be. It's only respected in GUI.
;; If the actual char height is larger, it respects the actual height.
(setq doom-modeline-height 25)

;; How wide the mode-line bar should be. It's only respected in GUI.
(setq doom-modeline-bar-width 3)

;; You can specify one if you encounter the issue.
(setq doom-modeline-project-detection 'project)
;; Please refer to https://github.com/bbatsov/projectile/issues/657.
(setq doom-modeline-buffer-file-name-style 'truncate-upto-project)

;; Whether display icons in mode-line. Respects `all-the-icons-color-icons'.
;; While using the server mode in GUI, should set the value explicitly.
(setq doom-modeline-icon (display-graphic-p))

;; Whether display the icon for `major-mode'. Respects `doom-modeline-icon'.
(setq doom-modeline-major-mode-icon t)

;; Whether display the colorful icon for `major-mode'.
;; Respects `doom-modeline-major-mode-icon'.
(setq doom-modeline-major-mode-color-icon t)

;; Whether display the icon for the buffer state. It respects `doom-modeline-icon'.
(setq doom-modeline-buffer-state-icon t)

;; Whether display the modification icon for the buffer.
;; Respects `doom-modeline-icon' and `doom-modeline-buffer-state-icon'.
(setq doom-modeline-buffer-modification-icon t)

;; Whether to use unicode as a fallback (instead of ASCII) when not using icons.
(setq doom-modeline-unicode-fallback t)

;; Whether display the minor modes in mode-line.
(setq doom-modeline-minor-modes nil)

;; If non-nil, a word count will be added to the selection-info modeline segment.
(setq doom-modeline-enable-word-count t)

;; Major modes in which to display word count continuously.
;; Also applies to any derived modes. Respects `doom-modeline-enable-word-count'.
;; If it brings the sluggish issue, disable `doom-modeline-enable-word-count' or
;; remove the modes from `doom-modeline-continuous-word-count-modes'.
(setq doom-modeline-continuous-word-count-modes '(markdown-mode gfm-mode org-mode))

;; Whether display the buffer encoding.
(setq doom-modeline-buffer-encoding t)

;; Whether display the indentation information.
(setq doom-modeline-indent-info t)

;; If non-nil, only display one number for checker information if applicable.
(setq doom-modeline-checker-simple-format t)

;; The maximum number displayed for notifications.
(setq doom-modeline-number-limit 99)

;; The maximum displayed length of the branch name of version control.
(setq doom-modeline-vcs-max-length 12)

;; Whether display the perspective name. Non-nil to display in mode-line.
(setq doom-modeline-persp-name t)

;; If non nil the default perspective name is displayed in the mode-line.
(setq doom-modeline-display-default-persp-name nil)

;; Whether display the `lsp' state. Non-nil to display in mode-line.
(setq doom-modeline-lsp t)
;; Including `evil', `overwrite', `god', `ryo' and `xah-fly-keys', etc.
(setq doom-modeline-modal-icon t)

;; Whether display the mu4e notifications. It requires `mu4e-alert' package.
(setq doom-modeline-mu4e nil)

;; Whether display the gnus notifications.
(setq doom-modeline-gnus t)

;; Wheter gnus should automatically be updated and how often (set to nil to disable)
(setq doom-modeline-gnus-timer 2)

;; Function to stylize the irc buffer names.
(setq doom-modeline-irc-stylize 'identity)

;; Whether display the environment version.
(setq doom-modeline-env-version t)
;; Change the executables to use for the language version string
(setq doom-modeline-env-python-executable "python3") ; or `python-shell-interpreter'
(setq doom-modeline-env-ruby-executable "ruby")
(setq doom-modeline-env-perl-executable "perl")
(setq doom-modeline-env-go-executable "go")
(setq doom-modeline-env-load-string "...")

;; Hooks
(after! doom-themes
  (remove-hook 'doom-load-theme-hook #'doom-themes-neotree-config))

;; Centaur Tabs
;; (setq centaur-tabs-style "rounded")
;; (setq centaur-tabs-set-icons t)
;; (setq centaur-tabs-set-bar 'under)
;; (setq centaur-tabs-height 32)
;; (setq centaur-tabs-gray-out-icons 'buffer)
;; (map! "C-c t t" #'centaur-tabs-group-by-projectile-project)
;; (map! "C-c t g" #'centaur-tabs-group-buffer-groups)

;; Fix undo tree problems with cache
(global-undo-tree-mode -1)

;; Global return
(global-set-key (kbd "<C-return>") (lambda ()
                   (interactive)
                   (end-of-line)
                   (newline-and-indent)))

;; Always use dired
(map! "C-x C-d" #'dired)
