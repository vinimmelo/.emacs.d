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
                        (registers . 5)
                        (hackernews . 5)))

;; Ivy Posframe
(require 'ivy-posframe)
;; display at `ivy-posframe-style'
(setq ivy-posframe-display-functions-alist '((t . ivy-posframe-)))
(setq ivy-posframe-display-functions-alist '((t . ivy-posframe-display-at-frame-center)))
(ivy-posframe-mode 1)

;; Remove auto save
(setq prelude-format-on-save nil)

;; Remove ^M of the end of line
(defun no-junk-please-were-unixish ()
  (let ((coding-str (symbol-name buffer-file-coding-system)))
    (when (string-match "-\\(?:dos\\|mac\\)$" coding-str)
      (set-buffer-file-coding-system 'unix))))

(add-hook 'find-file-hooks 'no-junk-please-were-unixish)

