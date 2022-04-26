;; INSTALL PACKAGES
;; -----------------------------------
(require 'package)
(require 'use-package)

(add-to-list 'package-archives
             '("melpa" . "https://stable.melpa.org/packages/") t)

(package-initialize)
(when (not package-archive-contents)
(package-refresh-contents))

(keyboard-translate ?\C-h ?\C-?) ;; some basic keyboard stuff, don't remove (written by Petr on 24 of June, 2019)

;; use real ls on darwin for dired
(when (string= system-type "darwin")
  (setq dired-use-ls-dired t
	insert-directory-program "/usr/local/bin/gls"
	dired-listing-switches "-aBhl --group-directories-first"))

;; remap help command
(global-set-key [?\C-x ?h] 'help-command)

;; fix line numbers
(global-linum-mode t)
(setq linum-format "%4d  ")

;; removes *messages* from the buffer
;; (setq-default message-log-max nil)
;; (kill-buffer "*Messages*")

;; ;; Removes *Completions* from buffer
;; (add-hook 'minibuffer-exit-hook
;; 	  '(lambda ()
;; 	     (let ((buffer "*Completions*"))
;; 	       (and (get-buffer buffer)
;; 		    (kill-buffer buffer)))))

;;;
(global-set-key (kbd "M-o") 'ace-window)


;; ---------------------
;; ------ Extension to mode mapping
;; ---------------------
 (setq-default c-basic-offset 4)

;; ---------------------
;; ------ Extension to mode mapping
;; ---------------------
(add-to-list 'auto-mode-alist '("\\.sf\\'" . snakemake-mode))

;; ---------------------
;; ------ Remove top bar
;; ---------------------
(add-to-list 'default-frame-alist
   	     '(font . "Hasklug NF-16"))

;; "DejaVuSansMono NF-15"

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
(setq org-todo-keywords '((sequence "TODO(t)" "ONGOING(0)" "WAITING(w)" "|" "DONE(d)" "CANCELLED(c)")))

;; setup keys
(global-set-key (kbd "C-c c") 'org-capture)
(global-set-key (kbd "C-c a") 'org-agenda)

;; (global-set-key (kbd "C-c C-w") 'org-refile-targets)
;; (setq org-refile-targets '(("~/Documents/Org/todo.org" :maxlevel . 3)
;;                            ("~/Documents/Org/someday.org" :level . 1)
;;                            ("~/Documents/Org/tickler.org" :maxlevel . 2)
;; 			   ("~/Documents/Org/meetings.org" :maxlevel . 5)))

(setq org-capture-templates '(("t" "Todo [inbox]" entry
                               (file+headline "~/Documents/Org/inbox.org" "Tasks")
                               "* TODO %i%?")
			      ("s" "Slipbox" entry
			       (file+headline "~/Documents/Org/roam/inbox.org" "Slipbox")
                               "* %i% \n %U"
			       :empty-lines 1)))

(add-hook 'org-mode-hook 'turn-on-auto-fill)
(add-hook 'org-mode-hook (lambda () (linum-mode 0)))

;; ---------------------
;; ------ agenda -------
;; ---------------------
(setq org-agenda-files (quote ("~/Documents/Org/inbox.org")))

;; ---------------------
;; ---- Marginalia -----
;; ---------------------

;; Enable richer annotations using the Marginalia package
(use-package marginalia
  :ensure t
  :config
  (marginalia-mode))

;; ---------------------
;; ------ Embark -------
;; ---------------------
(use-package embark
  :ensure t

  :bind
  (("C-." . embark-act)         ;; pick some comfortable binding
   ("M-." . embark-dwim)        ;; good alternative: M-.
   ("C-h B" . embark-bindings)) ;; alternative for `describe-bindings'

  :init

  ;; Optionally replace the key help with a completing-read interface
  (setq prefix-help-command #'embark-prefix-help-command)

  :config

  ;; Hide the mode line of the Embark live/completions buffers
  (add-to-list 'display-buffer-alist
               '("\\`\\*Embark Collect \\(Live\\|Completions\\)\\*"
                 nil
                 (window-parameters (mode-line-format . none)))))

;; Consult users will also want the embark-consult package.
(use-package embark-consult
  :ensure t
  :after (embark consult)
  :demand t ; only necessary if you have the hook below
  ;; if you want to have consult previews as you move around an
  ;; auto-updating embark collect buffer
  :hook
  (embark-collect-mode . consult-preview-at-point-mode))

;; ---------------------
;; ----- Orderless -----
;; ---------------------
;; Optionally use the `orderless' completion style.
(use-package orderless
  :ensure t
  :init
  (setq completion-styles '(orderless basic)
        completion-category-defaults nil
        completion-category-overrides '((file (styles partial-completion)))))

;; ---------------------
;; ------ Vertico ------
;; ---------------------
(use-package vertico
  :init
  (vertico-mode)

  ;; Different scroll margin
  ;; (setq vertico-scroll-margin 0)

  ;; Show more candidates
  ;; (setq vertico-count 20)

  ;; Grow and shrink the Vertico minibuffer
  ;; (setq vertico-resize t)

  ;; Optionally enable cycling for `vertico-next' and `vertico-previous'.
  ;; (setq vertico-cycle t)
  )

;; Persist history over Emacs restarts. Vertico sorts by history position.
(use-package savehist
  :init
  (savehist-mode))

;; A few more useful configurations...
(use-package emacs
  :init
  ;; Add prompt indicator to `completing-read-multiple'.
  ;; Alternatively try `consult-completing-read-multiple'.
  (defun crm-indicator (args)
    (cons (concat "[CRM] " (car args)) (cdr args)))
  (advice-add #'completing-read-multiple :filter-args #'crm-indicator)

  ;; Do not allow the cursor in the minibuffer prompt
  (setq minibuffer-prompt-properties
        '(read-only t cursor-intangible t face minibuffer-prompt))
  (add-hook 'minibuffer-setup-hook #'cursor-intangible-mode)

  ;; Emacs 28: Hide commands in M-x which do not work in the current mode.
  ;; Vertico commands are hidden in normal buffers.
   (setq read-extended-command-predicate
         #'command-completion-default-include-p)

  ;; Enable recursive minibuffers
  (setq enable-recursive-minibuffers t))

;; ---------------------
;; --------- Helm ------
;; ---------------------
;; (require 'helm)
;; (require 'helm-config)
;; (global-set-key (kbd "C-c h") 'helm-command-prefix)


;; ---------------------
;; ---- Projectile -----
;; ---------------------
;; (require 'projectile)
;; (define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
;; (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
;; (projectile-mode +1)


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

;; ---------------------
;; ------ Haskell ------
;; ---------------------
(use-package lsp-mode
  :init
  ;; set prefix for lsp-command-keymap (few alternatives - "C-l", "C-c l")
  (setq lsp-keymap-prefix "C-c l")
  :hook (;; replace XXX-mode with concretep major-mode(e. g. python-mode)
         (haskell-mode . lsp)
         ;; if you want which-key integration
         ;;(lsp-mode . lsp-enable-which-key-integration)
	 )
  :commands lsp)

;; optionally
(use-package lsp-ui :commands lsp-ui-mode)

;;(add-hook 'haskell-mode-hook #'lsp)
;;(add-hook 'haskell-literate-mode-hook #'lsp)


;; ;;; ------ THEMING -------
;; (unless (display-graphic-p) (load-theme 'manoj-dark))

;;; ------ CUSTOM --------
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(ansi-color-names-vector
   (vector "#ffffff" "#f36c60" "#8bc34a" "#fff59d" "#4dd0e1" "#b39ddb" "#81d4fa" "#262626"))
 '(custom-enabled-themes '(dracula))
 '(custom-safe-themes
   '("fe1c13d75398b1c8fd7fdd1241a55c286b86c3e4ce513c4292d01383de152cb7" default))
 '(fci-rule-color "#3a3a3a")
 '(flycheck-checker-error-threshold 800)
 '(hl-sexp-background-color "#121212")
 '(package-selected-packages
   '(lsp-ui lsp-mode embark-consult embark marginalia orderless vertico citar org-roam elpher ace-window projectile helm groovy-mode poly-R poly-markdown polymode ess yaml-mode fish-mode snakemake-mode dracula-theme visual-fill-column sicp markdown-mode haskell-mode gitignore-mode flycheck elpy))
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   '((20 . "#f36c60")
     (40 . "#ff9800")
     (60 . "#fff59d")
     (80 . "#8bc34a")
     (100 . "#81d4fa")
     (120 . "#4dd0e1")
     (140 . "#b39ddb")
     (160 . "#f36c60")
     (180 . "#ff9800")
     (200 . "#fff59d")
     (220 . "#8bc34a")
     (240 . "#81d4fa")
     (260 . "#4dd0e1")
     (280 . "#b39ddb")
     (300 . "#f36c60")
     (320 . "#ff9800")
     (340 . "#fff59d")
     (360 . "#8bc34a")))
 '(vc-annotate-very-old-color nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'downcase-region 'disabled nil)

;; ---------------------
;; ----- ORG-roam ------ 
;; ---------------------
(require 'org-roam)
(setq org-roam-directory (file-truename "~/Documents/Org/roam"))
(global-set-key (kbd "C-c C-f") 'org-roam-node-find)
(global-set-key (kbd "C-c C-i") 'org-roam-node-insert)
(global-set-key (kbd "C-c C-c") 'org-roam-capture)
(org-roam-db-autosync-mode)

;; make sure emacs loads org-roam info files
(require 'info)
(add-to-list 'Info-default-directory-list
             "~/.emacs.d/info")

(setq org-roam-capture-templates
      '(("m" "main" plain
         "%?"
         :if-new (file+head "main/${slug}.org"
                            "#+title: ${title}\n")
         :immediate-finish t
         :unnarrowed t)
        ("r" "reference" plain "%?"
         :if-new
         (file+head "reference/${title}.org" "#+title: ${title}\n")
         :immediate-finish t
         :unnarrowed t)))

(cl-defmethod org-roam-node-type ((node org-roam-node))
  "Return the TYPE of NODE."
  (condition-case nil
      (file-name-nondirectory
       (directory-file-name
        (file-name-directory
         (file-relative-name (org-roam-node-file node) org-roam-directory))))
    (error "")))

(setq org-roam-node-display-template
      (concat "${type:15} ${title:*} " (propertize "${tags:10}" 'face 'org-tag)))

(defun sus/tag-new-node-as-draft ()
  (org-roam-tag-add '("draft")))
(add-hook 'org-roam-capture-new-node-hook #'sus/tag-new-node-as-draft)

;; ---------------------
;; -- CITAR citations --
;; ---------------------
(use-package citar
  :no-require
  :custom
  (org-cite-global-bibliography '("~/Documents/Org/library.bib"))
  (org-cite-insert-processor 'citar)
  (org-cite-follow-processor 'citar)
  (org-cite-activate-processor 'citar)
  (citar-bibliography org-cite-global-bibliography)
  
  :bind
  (:map org-mode-map :package org ("C-c C-b" . #'org-cite-insert)))

