(require 'package)
(package-initialize)

(setq find-file-visit-truename t)

(add-to-list 'package-archives
             '("melpa" . "https://stable.melpa.org/packages/") t)

(require 'org)
(org-babel-load-file
 (expand-file-name "config/init.org" user-emacs-directory))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(vundo undo-tree eglot-grammarly yasnippet yaml-mode which-key vertico use-package treemacs-projectile treemacs-icons-dired treemacs-all-the-icons spaceline-all-the-icons snakemake-mode reverse-im restart-emacs pyvenv org-superstar org-roam org-present org-modern org-journal orderless monokai-theme math-symbol-lists marginalia magit-popup magit lsp-ui lsp-treemacs lsp-pyright lsp-jedi lsp-ivy lsp-grammarly julia-mode jedi-core highlight-indentation helm flycheck exec-path-from-shell embark-consult elpher eglot dracula-theme doom-modeline dockerfile-mode diminish counsel citar)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
