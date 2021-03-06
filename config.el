 (setq byte-compile-warnings '(cl-functions))

 (setq beacon-mode 1) ;; enable beacon mode
 ;; Place your private configuration here! Remember, you do not need to run 'doom
 ;; sync' after modifying this file!

 (setq user-full-name "Kenneth Lawson"
       user-mail-address "lawsonkenneth755@gmail.com")

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

(setq org-journal-dir "~/Dropbox/org/journal/"
      org-journal-date-prefix "#+TITLE: "
      org-journal-time-prefix "* "
      org-journal-date-format "%a, %Y-%m-%d"
      org-journal-file-format "%Y-%m-%d.org")

(defun org-colors-dracula ()
  "Enable Dracula colors for Org headers."
  (interactive)
  (dolist
      (face
       '((org-level-1 1.7 "#8be9fd" ultra-bold)
         (org-level-2 1.6 "#bd93f9" extra-bold)
         (org-level-3 1.5 "#50fa7b" bold)
         (org-level-4 1.4 "#ff79c6" semi-bold)
         (org-level-5 1.3 "#9aedfe" normal)
         (org-level-6 1.2 "#caa9fa" normal)
         (org-level-7 1.1 "#5af78e" normal)
         (org-level-8 1.0 "#ff92d0" normal)))
    (set-face-attribute (nth 0 face) nil :font doom-variable-pitch-font :weight (nth 3 face) :height (nth 1 face) :foreground (nth 2 face)))
    (set-face-attribute 'org-table nil :font doom-font :weight 'normal :height 1.0 :foreground "#bfafdf"))

(eval-after-load "org-present"
  '(progn
     (add-hook 'org-present-mode-hook
               (lambda ()
                 (org-present-big)
                 (org-display-inline-images)
                 (org-present-hide-cursor)
                 (org-present-read-only)))
     (add-hook 'org-present-mode-quit-hook
               (lambda ()
                 (org-present-small)
                 (org-remove-inline-images)
                 (org-present-show-cursor)
                 (org-present-read-write)))))

(custom-set-faces
 '(markdown-header-face ((t (:inherit font-lock-function-name-face :weight bold :family "variable-pitch"))))
 '(markdown-header-face-1 ((t (:inherit markdown-header-face :height 1.8))))
 '(markdown-header-face-2 ((t (:inherit markdown-header-face :height 1.4))))
 '(markdown-header-face-3 ((t (:inherit markdown-header-face :height 1.2)))))

(require 'elfeed-goodies)
(elfeed-goodies/setup)
(setq elfeed-goodies/entry-pane-size 0.5)
(setq elfeed-feeds (quote
                    (("https://gamingonlinux.com/article_rss.php" gaming on linux)
                     ("https://hackaday.com/blog/feedd/" hackaday)
                     ("https://opensource.com/feed" opensource linux)
                     ("https://www.snopes.com/feed/" snopes)
                     ("https://chaski.huffpost.com/us/auto/vertical/books" hp books)
                     ("https://chaski.huffpost.com/us/auto/vertical/education" hp education)
                     ("https://chaski.huffpost.com/us/auto/vertical/queer-voices" hp queer)
                     ("https://chaski.huffpost.com/us/auto/vertical/science" hp science)
                     ("https://chaski.huffpost.com/us/auto/vertical/technology" hp technology)
                     ("https://chaski.huffpost.com/us/auto/vertical/green" hp green)
                     ("https://chaski.huffpost.com/us/auto/vertical/media" hp media)
                     ("https://chaski.huffpost.com/us/auto/vertical/politics" hp politics)
                     ("https://chaski.huffpost.com/us/auto/vertical/religion" hp religion)
                     ("https://chaski.huffpost.com/us/auto/vertical/world-news" hp world)
                     ("https://chaski.huffpost.com/us/auto/vertical/us-news" hp us)
                     ("https://opensource.com/feed" opensource linux)
                     ("https://linux.softpedia.com/backend.xml" softpedia linux)
                     ("https://itsfoss.com/feed/" itsfoss)
                     ("https://www.zdnet.com/topic/linux/rss.xml" zdnet linux)
                     ("https://www.phoronix.com/rss.php" phoronix)
                     ("http://feeds.feedburner.com/d0od" omgubuntu)
                     ("https://www.computerworld.com/index.rss" computerworld)
                     ("https://feeds.arstechnica.com/arstechnica/index" arstechnica)
                     ("http://www.theverge.com/rss/index.xml" the verge))))

(after! neotree
  (setq neo-smart-open t
        neo-window-fixed-size nil))
(after! doom-themes
  (setq doom-neotree-enable-variable-pitch t))
(map! :leader
      :desc "Toggle neotree file viewer" "t n" #'neotree-toggle
      :desc "Open directory in neotree" "d n" #'neotree-dir)
