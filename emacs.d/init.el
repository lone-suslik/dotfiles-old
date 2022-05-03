(add-to-list 'load-path "/usr/share/emacs/site-lisp/ess/lisp")
(load "ess-autoloads")
(require 'ess-r-mode)

(require 'package)
(package-initialize)

(add-to-list 'package-archives
             '("melpa" . "https://stable.melpa.org/packages/") t)

(require 'org)
(org-babel-load-file
 (expand-file-name "config/init.org" user-emacs-directory))
