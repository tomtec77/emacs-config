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
(add-to-list 'load-path "~/.emacs.d/lisp")
(require 'column-marker)
(add-hook 'find-file-hook (lambda () (interactive) (column-marker-1 80)))

;; Dimensions of the Emacs window: set width to 84 characters
(add-to-list 'default-frame-alist '(width . 84))

;; Python mode: enable auto indent
(add-hook 'python-mode-hook 'my-python-hook)

(defun my-python-hook ()
  (define-key python-mode-map (kbd "RET") 'newline-and-indent))

;; Enable MELPA package archive for easy install of addons
(require 'package)
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
		    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))
  (when no-ssl
    (warn "\
Your version of Emacs does not support SSL connections,
which is unsafe because it allows man-in-the-middle attacks.
There are two things you can do about this warning:
1. Install an Emacs version that does support SSL and be safe.
2. Remove this warning from your init file so you won't see it again."))
  ;; Comment/uncomment these two lines to enable/disable MELPA and MELPA Stable as desired
  ;;(add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t)
  (add-to-list 'package-archives (cons "melpa-stable" (concat proto "://stable.melpa.org/packages/")) t)
  (when (< emacs-major-version 24)
    ;; For important compatibility libraries like cl-lib
    (add-to-list 'package-archives (cons "gnu" (concat proto "://elpa.gnu.org/packages/")))))
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
