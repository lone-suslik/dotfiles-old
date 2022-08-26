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
 '(org-agenda-files
   '("/Users/kqql397/Documents/org/archive/az.org" "/Users/kqql397/Documents/org/archive/crypto.org" "/Users/kqql397/Documents/org/archive/crypto_notes.org" "/Users/kqql397/Documents/org/archive/interviews-omics-platform.org" "/Users/kqql397/Documents/org/archive/switzerland.org" "/Users/kqql397/Documents/org/brain-tool/BrainTool.org" "/Users/kqql397/Documents/org/notebooks/sklearn-test-0001.org" "/Users/kqql397/Documents/org/roam/people/anastasia_askarova.org" "/Users/kqql397/Documents/org/roam/people/ben_keith.org" "/Users/kqql397/Documents/org/roam/people/claus_bendtsen.org" "/Users/kqql397/Documents/org/roam/people/dan_paulson.org" "/Users/kqql397/Documents/org/roam/people/karl_nordström.org" "/Users/kqql397/Documents/org/roam/people/leo_whyte.org" "/Users/kqql397/Documents/org/roam/people/lilia_abtroun.org" "/Users/kqql397/Documents/org/roam/people/linda_roth.org" "/Users/kqql397/Documents/org/roam/people/misha_kapusheski.org" "/Users/kqql397/Documents/org/roam/people/shalini_andersson.org" "/Users/kqql397/Documents/org/roam/people/vijay_chandrasekar.org" "/Users/kqql397/Documents/org/roam/references/ben-davidGeneticTranscriptionalEvolution2018.org" "/Users/kqql397/Documents/org/roam/references/burgessMendelianRandomizationWhere2015.org" "/Users/kqql397/Documents/org/roam/references/chenLiveseqEnablesTemporal2022.org" "/Users/kqql397/Documents/org/roam/references/clarkIronKingdomRise2009.org" "/Users/kqql397/Documents/org/roam/references/dawkinsSelfishGene1990.org" "/Users/kqql397/Documents/org/roam/references/moffittEmergingLandscapeSpatial2022.org" "/Users/kqql397/Documents/org/roam/references/spainStrategiesFinemappingComplex2015.org" "/Users/kqql397/Documents/org/roam/references/swerdlowSelectingInstrumentsMendelian2016.org" "/Users/kqql397/Documents/org/roam/references/wangPosttranslationalControlBeige2022.org" "/Users/kqql397/Documents/org/roam/references/wuDownregulationLncRNAMALAT12018.org" "/Users/kqql397/Documents/org/roam/references/zouFinemappingSummaryData2022.org" "/Users/kqql397/Documents/org/roam/inbox.org" "/Users/kqql397/Documents/org/inbox.org" "/Users/kqql397/Documents/org/journal.org" "/Users/kqql397/Documents/org/morning.org" "/Users/kqql397/Documents/org/notes-az.org" "/Users/kqql397/Documents/org/notes-personal.org" "/Users/kqql397/Documents/org/projects.org" "/Users/kqql397/Documents/org/shopping-list.org" "/Users/kqql397/Documents/org/snippets.org" "/Users/kqql397/Documents/org/todo-az.org" "/Users/kqql397/Documents/org/todo-personal.org" "/Users/kqql397/Documents/org/writing.org"))
 '(package-selected-packages
   '(citar-org-roam citar yaml-mode xclip which-key vertico use-package projectile pdf-tools pcre2el org-roam org-present org-journal orderless monokai-theme marginalia lsp-ui lsp-jedi key-chord ivy hydra htmlize helm-org helm-bibtex flycheck embark-consult eglot doom-modeline diminish company bibtex-completion)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
