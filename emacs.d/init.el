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
   '(citar-org-roam citar yaml-mode xclip which-key vertico use-package projectile pdf-tools pcre2el org-roam org-present org-journal orderless monokai-theme marginalia lsp-ui lsp-jedi key-chord ivy hydra htmlize helm-org helm-bibtex flycheck embark-consult eglot doom-modeline diminish company bibtex-completion)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
