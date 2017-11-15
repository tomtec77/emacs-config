;; No beeps, flash on errors
(setq-default visible-bell t)

;; Highlight marked regions
(transient-mark-mode t)

;; Enable column numbering in the mode line
(setq column-number-mode t)

;; Text highlighting always on
(global-font-lock-mode 1)

;; Enable dead keys
(require 'iso-transl)

;; Highlight column 80
(add-to-list 'load-path "~/.emacs.d/")
(require 'column-marker)
(add-hook 'find-file-hook (lambda () (interactive) (column-marker-1 80)))

;; Enable MELPA package archive for easy install of addons
(require 'package)
(add-to-list 'package-archives
	     '("melpa-stable" . "https://stable.melpa.org/packages/"))
(package-initialize)

;; Package installations: M-x package-install RET, then the package name
;; - Markdown mode: markdown-mode
;;    See https://jblevins.org/projects/markdown-mode/


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(inhibit-startup-screen t)
 '(markdown-command "pandoc --webtex")
 '(markdown-enable-math t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(font-lock-builtin-face ((t (:foreground "magenta2"))))
 '(font-lock-comment-face ((t (:foreground "medium blue"))))
 '(font-lock-function-name-face ((t (:foreground "black" :weight semi-bold))))
 '(font-lock-keyword-face ((t (:foreground "RoyalBlue2" :weight semi-bold))))
 '(font-lock-string-face ((t (:foreground "firebrick2"))))
 '(font-lock-type-face ((t (:foreground "lime green")))))
