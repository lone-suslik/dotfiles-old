(require 'package)
(package-initialize)

;; ensure custom does not modify this file
(setq custom-file "~/.emacs-custom.el")
(load custom-file 'noerror)

;; get rid of the 'editing softlink' notification
(setq find-file-visit-truename t)

;; load package repositories
(add-to-list 'package-archives
             '("melpa" . "https://stable.melpa.org/packages/") t)

;; load the actual config
(require 'org)
(org-babel-load-file
 (expand-file-name "config/init.org" user-emacs-directory))
