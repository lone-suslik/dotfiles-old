;; INSTALL PACKAGES
;; -----------------------------------

(require 'package)

(add-to-list 'package-archives
             '("melpa" . "https://stable.melpa.org/packages/") t)


(package-initialize)
(when (not package-archive-contents)
(package-refresh-contents))


(keyboard-translate ?\C-h ?\C-?) ;; some basic keyboard stuff, don't remove (written by Petr on 24 of June, 2019)

;; fix line numbers
(global-linum-mode t)
(setq linum-format "%4d  ")

;; removes *messages* from the buffer
(setq-default message-log-max nil)
(kill-buffer "*Messages*")

;; Removes *Completions* from buffer
(add-hook 'minibuffer-exit-hook
	  '(lambda ()
	     (let ((buffer "*Completions*"))
	       (and (get-buffer buffer)
		    (kill-buffer buffer)))))

;;;
(global-set-key (kbd "M-o") 'ace-window)

;; ---------------------
;; ------ Extension to mode mapping
;; ---------------------
(add-to-list 'auto-mode-alist '("\\.sf\\'" . snakemake-mode))

;; ---------------------
;; ------ Remove top bar
;; ---------------------
(add-to-list 'default-frame-alist
	     '(font . "Hasklug NF-17"))

;;"DejaVuSansMono NF-15"

;; ---------------------
;; ------ Remove top bar
;; ---------------------
(menu-bar-mode -1)
(tool-bar-mode -1)
;;(toggle-scroll-bar -1)

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
(setq org-todo-keywords '((sequence "TODO(t)" "ONGOING(0)" "WAITING(w)" "|" "DONE(d)" "CANCELLED(c)")))
(global-set-key (kbd "C-c c") 'org-capture)
(global-set-key (kbd "C-c C-w") 'org-refile-targets)
;;(global-set-key (kbd "S-

(setq org-refile-targets '(("~/Documents/Org/todo.org" :maxlevel . 3)
                           ("~/Documents/Org/someday.org" :level . 1)
                           ("~/Documents/Org/tickler.org" :maxlevel . 2)
			   ("~/Documents/Org/meetings.org" :maxlevel . 5)))

(setq org-capture-templates '(("t" "Todo [inbox]" entry
                               (file+headline "~/Documents/Org/inbox.org" "Tasks")
                               "* TODO %i%?")
                              ("T" "Tickler" entry
                               (file+headline "~/Documents/Org/tickler.org" "Tickler")
                               "* %i%? \n %U")))

;; ---------------------
;; --------- Helm ------
;; ---------------------
(require 'helm)
(require 'helm-config)
(global-set-key (kbd "C-c h") 'helm-command-prefix)


;; ---------------------
;; ---- Projectile -----
;; ---------------------
(require 'projectile)
(define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
(projectile-mode +1)


;; ---------------------
;; --------- R ---------
;; ---------------------
(require 'ess-site)

(add-hook 'ess-mode-hook
	  (lambda ()
	    (setq-local split-width-threshold 0)
	    (ess-set-style 'RStudio)
	    (ess-toggle-underscore nil)
	    (setq ess-ask-for-ess-directory nil)
	    (define-key ess-mode-map (kbd "C-j") 'ess-eval-region-or-line-and-step)))
;; (define-key ess-r-mode-map(kbd "C-j") ')

;; ---------------------
;; ------ PYTHON -------
;; ---------------------

;; enable elpy
(elpy-enable)

(when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))
(add-hook 'elpy-mode-hook (lambda () (highlight-indentation-mode -1)))

:init (global-flycheck-mode)

;; ;;; ------ THEMING -------
;; (unless (display-graphic-p) (load-theme 'manoj-dark))

;; ;;; ------ CUSTOM --------
;; (custom-set-variables
;;  ;; custom-set-variables was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  '(ansi-color-faces-vector
;;    [default bold shadow italic underline bold bold-italic bold])
;;  '(ansi-color-names-vector
;;    (vector "#ffffff" "#f36c60" "#8bc34a" "#fff59d" "#4dd0e1" "#b39ddb" "#81d4fa" "#262626"))
;;  '(custom-safe-themes
;;    (quote
;;     ("732b807b0543855541743429c9979ebfb363e27ec91e82f463c91e68c772f6e3" "a24c5b3c12d147da6cef80938dca1223b7c7f70f2f382b26308eba014dc4833a" default)))
;;  '(fci-rule-color "#3a3a3a")
;;  '(flycheck-checker-error-threshold 800)
;;  '(hl-sexp-background-color "#121212")
;;  '(package-selected-packages
;;    (quote
;;     (julia-mode haskell-mode sicp telega gitignore-mode markdown-mode ## monokai-theme spacemacs-theme snakemake-mode color-theme yaml-mode groovy-mode py-autopep8 flycheck elpy ess material-theme better-defaults)))
;;  '(vc-annotate-background nil)
;;  '(vc-annotate-color-map
;;    (quote
;;     ((20 . "#f36c60")
;;      (40 . "#ff9800")
;;      (60 . "#fff59d")
;;      (80 . "#8bc34a")
;;      (100 . "#81d4fa")
;;      (120 . "#4dd0e1")
;;      (140 . "#b39ddb")
;;      (160 . "#f36c60")
;;      (180 . "#ff9800")
;;      (200 . "#fff59d")
;;      (220 . "#8bc34a")
;;      (240 . "#81d4fa")
;;      (260 . "#4dd0e1")
;;      (280 . "#b39ddb")
;;      (300 . "#f36c60")
;;      (320 . "#ff9800")
;;      (340 . "#fff59d")
;;      (360 . "#8bc34a"))))
;;  '(vc-annotate-very-old-color nil))
;; (custom-set-faces
;;  ;; custom-set-faces was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  )
(put 'downcase-region 'disabled nil)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (dracula)))
 '(custom-safe-themes
   (quote
    ("fe1c13d75398b1c8fd7fdd1241a55c286b86c3e4ce513c4292d01383de152cb7" default)))
 '(package-selected-packages
   (quote
    (ace-window projectile helm groovy-mode poly-R poly-markdown polymode ess yaml-mode fish-mode snakemake-mode dracula-theme visual-fill-column sicp markdown-mode haskell-mode gitignore-mode flycheck elpy))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
