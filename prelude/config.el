(custom-set-variables
 '(initial-frame-alist (quote ((fullscreen . maximized)))))

(prelude-require-packages '(doom-modeline
                             doom-themes
                             ivy-posframe
                             dashboard
                             dashboard-hackernews
                             all-the-icons
                             all-the-icons-dired
                             all-the-icons-ivy
                             neotree
                             flx
                             yasnippet
                             diff-hl
                             diredfl
                             ibuffer-projectile
                             ibuffer-vc
                             elpy
                             company-box
                             dired-icon
                             emojify
                             ivy-rich
                             amx
                             org-superstar
                             org-re-reveal
                             ag
                             counsel-projectile
                             hc-zenburn-theme
                             color-theme-sanityinc-tomorrow
                             all-the-icons-ibuffer))
;; Dashboard
(require 'dashboard)
(require 'dashboard-hackernews)
(dashboard-setup-startup-hook)
(setq dashboard-banner-logo-title "Bem vindo mestre Vinícius!!!")
(setq dashboard-center-content t)
(setq dashboard-startup-banner "/home/thelink/Pictures/emacsV2.iconset/256x256.png")

(setq dashboard-items '((recents  . 5)
                        (bookmarks . 5)
                        (projects . 5)
                        (agenda . 5)
                        (hackernews . 5)))

;; Ivy Posframe
(require 'ivy-posframe)
;; display at `ivy-posframe-style'
(setq ivy-posframe-display-functions-alist '((t . ivy-posframe-)))
(setq ivy-posframe-display-functions-alist '((t . ivy-posframe-display-at-frame-center)))
(ivy-posframe-mode 1)

(setcdr (assq t ivy-format-functions-alist) #'ivy-format-function-line)

;; Remove auto save
(setq prelude-format-on-save nil)

;; Remove ^M of the end of line
(defun no-junk-please-were-unixish ()
  (let ((coding-str (symbol-name buffer-file-coding-system)))
    (when (string-match "-\\(?:dos\\|mac\\)$" coding-str)
      (set-buffer-file-coding-system 'utf-8-unix))))

(add-hook 'find-file-hooks 'no-junk-please-were-unixish)

;; Company
(require 'company-box)
(add-hook 'company-mode-hook 'company-box-mode)

;; Fill Column
(setq fill-column 120)
(setq-default fill-column 120)

;; Emmet
(add-hook 'sgml-mode-hook 'emmet-mode) ;; Auto-start on any markup modes
(add-hook 'css-mode-hook  'emmet-mode) ;; enable Emmet's css abbreviation.

(global-unset-key "\C-j")
(global-set-key "\C-j" 'emmet-expand-line)

(global-set-key (kbd "C-x C-d") 'dired)

;; Key Chord
(require 'key-chord)
(key-chord-define-global "jw" 'avy-goto-char-2)

(scroll-bar-mode -1)

;; Performance LSP
(setq gc-cons-threshold 100000000)
(setq read-process-output-max (* 1024 1024))
(setq lsp-ui-doc-enable nil)

(require 'lsp-mode)
(add-hook 'web-mode-hook #'lsp)
(add-hook 'typescript-mode-hook #'lsp)

(global-set-key (kbd "s-g") #'magit-status)

(add-hook 'org-mode-hook (lambda () (org-superstar-mode 1)))
(add-hook 'dired-mode-hook 'all-the-icons-dired-mode)

(setq all-the-icons-ivy-file-commands
      '(counsel-find-file counsel-file-jump counsel-recentf counsel-projectile-find-file counsel-projectile-find-dir projectile-find-file
                          projectile-find-dir projectile-completing-read))
(setq buffer-file-name nil)

;; Counsel configuration
(require 'ivy-rich)
(counsel-projectile-mode)
(all-the-icons-ivy-setup)
(all-the-icons-ivy-rich-mode 1)
(ivy-rich-mode 1)

;; Add maximized mode when open with emacsclient
(add-to-list 'default-frame-alist '(fullscreen . maximized))

;; Prettier
(add-hook 'web-mode-hook 'prettier-js-mode)
(add-hook 'web-mode-hook 'prettier-js-mode)

;; Yasnippet
(yas-global-mode 1)

;; Multiple cursor
(global-set-key (kbd "C-c m c") 'mc/edit-lines)
(global-set-key (kbd "C-c m n") 'mc/mark-next-like-this-symbol)
(global-set-key (kbd "C-c m p") 'mc/mark-previous-like-this-symbol)
(global-set-key (kbd "C-c m b") 'mc/edit-beginnings-of-lines)
(global-set-key (kbd "C-c m e") 'mc/edit-ends-of-lines)
(global-set-key (kbd "C-c m m") 'mc/mark-next-like-this)

;; Flyspell specifics
(setq flyspell-issue-message-flag nil)

;; Specifics when open emacs on emacsclient
(if (< (length command-line-args) 2)
    (setq initial-buffer-choice (lambda () (get-buffer "*dashboard*"))))

;; Redisplay specifics
(setq redisplay-dont-pause t)
