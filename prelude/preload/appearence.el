(setq prelude-theme 'monokai-pro)
(set-face-attribute 'default nil
                    :font "JetBrains Mono"
                    :height 110)

(prefer-coding-system 'utf-8-unix)
(set-default-coding-systems 'utf-8-unix)
(set-terminal-coding-system 'utf-8-unix)
(set-keyboard-coding-system 'utf-8-unix)
(if (boundp 'buffer-file-coding-system)
    (setq-default buffer-file-coding-system 'utf-8-unix)
  (setq default-buffer-file-coding-system 'utf-8-unix))
