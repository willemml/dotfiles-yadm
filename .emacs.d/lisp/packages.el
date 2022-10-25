;;; packages.el --- Install and configure packages
;;; Commentary:
;; Package init file --- install and configure packages

;;; Code:

(setq my/required-packages '(dracula-theme
							 format-all
							 emacsql-sqlite
							 plantuml-mode
							 graphviz-dot-mode
							 org-roam
							 org-roam-ui
							 org-latex-impatient
							 org-fragtog
							 lsp-mode
							 lsp-java
                             lsp-ui
							 git-modes
							 groovy-mode
							 company
							 yasnippet
							 yasnippet-snippets
							 rust-mode
							 tree-sitter
							 tree-sitter-langs))

(let ((default-directory (expand-file-name "~/.emacs.d/gitpackages")))
  (normal-top-level-add-subdirs-to-load-path))

;; Enable package manager
(require 'package)

;; Melpa
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; Org ELPA archive
(add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/") t)

(package-initialize)

;; Get available packages
(unless package-archive-contents
  (package-refresh-contents))

(defun my/install-if-missing (packagename)
  "Install a package if it is not already installed"
  (when (not (package-installed-p packagename))
    (package-install packagename)))

;; install packages listed in "my/required-packages"
(defun my/install-required-packages ()
  "Install packages listed in 'my/required-packages'."
  (dolist (package my/required-packages nil)
    (my/install-if-missing package)))

(my/install-required-packages)

(if (eq system-type 'darwin)
	(require 'org-mac-image-paste))


(provide 'packages)

;;; packages.el ends here
