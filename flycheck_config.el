(setq byte-compile-warnings '(cl-functions))


(setq beacon-mode 1) ;; enable beacon mode
;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!
;;
(setq user-full-name "Kenneth Lawson"
      user-mail-address "lawsonkenneth755@gmail.com")
(use-package! org-auto-tangle
  :defer t
  :hook (org-mode . org-auto-tangle-mode)
  :config
  (setq org-auto-tangle-default t))
;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-unicode-font' -- for unicode glyphs
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
 (setq doom-font (font-spec :family "FiraCode Nerd Font" :size 15 :weight 'semi-light)
      doom-variable-pitch-font (font-spec :family "FiraCode Nerd Font" :size 16)
      projectile-project-search-path '("~/.dotfiles" "~/.doom.d" "~/Dropbox/Projects"))
;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-dracula)
;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'relative)
(add-hook! '+doom-dashboard-functions :append
  (insert "\n" (+doom-dashboard--center +doom-dashboard--width "Powered by Emacs!")))

(setq fancy-splash-image (concat doom-private-dir "doomEmacsDracula.svg"))
(require 'org)
(setq org-clock-sound "~/.doom.d/bell.wav")
;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/Dropbox/org/")

(after! org
       (map! :map org-mode-map
             :n "M-J" #'org-metadown
             :n "M-k" #'org-metaup))
(add-hook 'org-mode-hook
          (lambda ()
            (org-superstar-mode 1)))
