(require 'package)
(package-initialize)

(setq find-file-visit-truename t)

(add-to-list 'package-archives
             '("melpa" . "https://stable.melpa.org/packages/") t)

(require 'org)
(org-babel-load-file
 (expand-file-name "config/init.org" user-emacs-directory))
