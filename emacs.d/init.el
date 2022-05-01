(require 'package)
(package-initialize)

(add-to-list 'package-archives
             '("melpa" . "https://stable.melpa.org/packages/") t)

(setq custom-file "~/.emacs.d/custom.el")
(when (file-exists-p custom-file)
  (load custom-file))

(require 'org)
(org-babel-load-file
 (expand-file-name "config/init.org" user-emacs-directory))

