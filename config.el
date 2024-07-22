;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "John Doe"
      user-mail-address "john@doe.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
;;(setq doom-theme 'doom-one)
(setq doom-theme 'doom-xcode)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)


;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

;; exit no confirm
confirm-kill-emacs nil
(global-set-key (kbd "M-t") 'treemacs-select-window)
(global-set-key (kbd "M-n") 'neotree)
(global-set-key (kbd "C-]") 'evil-jump-to-tag)
(global-set-key (kbd "C-.") 'evil-jump-forward)
(global-set-key (kbd "C-,") 'evil-jump-backward)
(setq doom-font (font-spec :family "Monaco" :size 16 :weight 'semi-light))

(+global-word-wrap-mode t)
(after! lsp-mode
        (setq lsp-auto-guess-root t))
(after! projectile
          (add-to-list 'projectile-project-root-files-bottom-up ".projectile"))
(global-set-key (kbd "C-c /") 'comment-or-uncomment-region)
;; disable highlighting current line
(custom-set-faces
  '(default ((t (:background "#000000"))))
  '(hl-line ((t (:background "#000000"))))
 )

;;golang

(setq lsp-gopls-staticcheck t)
(setq lsp-eldoc-render-all t)
(setq lsp-gopls-complete-unimported t)

(use-package lsp-mode
  :ensure t
  :commands (lsp lsp-deferred)
  :hook (go-mode . lsp-deferred))

;; Set up before-save hooks to format buffer and add/delete imports.
;; Make sure you don't have other gofmt/goimports hooks enabled.
(defun lsp-go-install-save-hooks ()
  (add-hook 'before-save-hook #'lsp-format-buffer t t)
  (add-hook 'before-save-hook #'lsp-organize-imports t t))
(add-hook 'go-mode-hook #'lsp-go-install-save-hooks)

;; Optional - provides fancier overlays.
(use-package lsp-ui
  :ensure t
  :commands lsp-ui-mode)

;; Company mode is a standard completion package that works well with lsp-mode.
(use-package company
  :ensure t
  :config
  ;; Optionally enable completion-as-you-type behavior.
  (setq company-idle-delay 0)
  (setq company-minimum-prefix-length 1))

;; Optional - provides snippet support.
(use-package yasnippet
  :ensure t
  :commands yas-minor-mode
  :hook (go-mode . yas-minor-mode))

;;rust
(setq rustic-lsp-server 'rust-analyzer)

;;cmake-mode disable format
(setq-hook! 'cmake-mode-hook +format-with :none)
(setq-hook! 'c-mode-hook +format-with :none)
(setq-hook! 'c++-mode-hook +format-with :none)
(setq-hook! 'python-mode-hook +format-with :none)

(defun compile-and-run-c ()
  "Compile and run the current C file."
  (interactive)
  (compile (concat "gcc -I../include -I../../include -lm -lpthread -L../lib -o /tmp/cdebug.exe" " " buffer-file-name " && " "/tmp/cdebug.exe" )))
(global-set-key (kbd "C-c C-r") 'compile-and-run-c)
(global-set-key (kbd "<f5>") 'compile-and-run-c)
(setq doom-modeline-modal-icon nil) ;; show evil mode status

;;(setq global-flycheck-mode nil);; disable flycheck
;;(setq flycheck-check-syntax-automatically '(save mode-enabled));; flycheck when save file
;; disable pylint flake8
;;(setq lsp-pylsp-plugins-pylint-enabled nil)
;;(setq lsp-pylsp-plugins-flake8-enabled nil)
;;lsp frequency and cpu limit
(setq lsp-idle-delay 0.5)
(setq lsp-diagnostics-provider :none)

