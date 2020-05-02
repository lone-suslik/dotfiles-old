
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

;; INSTALL PACKAGES
;; -----------------------------------
(require 'package)

(setq-default left-margin-width  3)
(setq-default right-margin-width  3)

(add-to-list 'package-archives
       '("melpa" . "http://melpa.org/packages/") t)

(package-initialize)
(when (not package-archive-contents)
  (package-refresh-contents))


(keyboard-translate ?\C-h ?\C-?) ;; some basic keyboard stuff, don't remove (written by Petr on 24 of June, 2019)

;; fonts
(set-frame-font "Hasklug Nerd Font Mono 12")

;; fix line numbers
(global-linum-mode t)
(setq linum-format "%4d  ")

;; turn of the toolbar & menubar
(tool-bar-mode -1)
(menu-bar-mode -1)
(toggle-scroll-bar -1)
;; ---------------------
;; ------ EMACS Backups
;; --------------------

(setq backup-directory-alist `(("." . "~/.emacs_backups")))
(setq backup-by-copying t)
(setq delete-old-versions t
  kept-new-versions 6
  kept-old-versions 2
  version-control t)
(setq auto-save-file-name-transforms
  `((".*" "~/.emacs_autosaves/" t)))


;; ---------------------
;; -------- ORG --------
;; ---------------------

(require 'org-inlinetask)
(setq org-log-done t)
(setq org-agenda-files (list ""))
(setq org-todo-keywords '((sequence "TODO(t)" "WAITING(w)" "|" "DONE(d)" "CANCELLED(c)")))
(global-set-key (kbd "C-c c") 'org-capture)
(global-set-key (kbd "C-c C-w") 'org-refile-targets)


(setq org-refile-targets '(("~/Documents/Org/todo.org" :maxlevel . 3)
                           ("~/Documents/Org/someday.org" :level . 1)
			   ("~/Documents/Org/meetings.org" :maxlevel . 5)))

(setq org-capture-templates '(("t" "Todo [inbox]" entry
                               (file+headline "~/Documents/Org/inbox.org" "Tasks")
                               "* TODO %i%?")
                              ("T" "Tickler" entry
                               (file+headline "~/Documents/Org/tickler.org" "Tickler")
                               "* %i%? \n %U")))
;; ---------------------
;; ------ PYTHON -------
;; ---------------------

(elpy-enable)

(when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))
(add-hook 'elpy-mode-hook (lambda () (highlight-indentation-mode -1)))

:init (global-flycheck-mode)

;;; ------ THEMING -------



;;; ------ CUSTOM --------
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (dracula)))
 '(custom-safe-themes
   (quote
    ("13fa7a304bd53aa4c0beec4c25c4f811de499bce9deb326798265ed0015b3b78" "a41b81af6336bd822137d4341f7e16495a49b06c180d6a6417bf9fd1001b6d2b" default)))
 '(inhibit-startup-screen t)
 '(package-selected-packages
   (quote
    (fish-mode dracula-theme dockerfile-mode yaml-mode snakemake-mode flycheck ess-smart-equals ess-smart-underscore ess elpy))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
