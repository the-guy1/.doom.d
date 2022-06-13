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
(setq doom-font (font-spec :family "FiraCode Nerd Font" :size 16 :weight 'semi-light)
      doom-variable-pitch-font (font-spec :family "FiraCode Nerd Font" :size 17)
      ; projectile-project-search-path '("~/.dotfiles" "~/.doom.d" "~/Dropbox/Projects")

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

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/Dropbox/org/")

(setq org-journal-dir "~/Dropbox/org/journal/"
      org-journal-date-prefix "#+TITLE: "
      org-journal-time-prefix "* "
      org-journal-date-format "%a, %Y-%m-%d"
      org-journal-file-format "%Y-%m-%d.org")

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

(use-package! org-auto-tangle
  :defer t
  :hook (org-mode . org-auto-tangle-mode)
  :config
  (setq org-auto-tangle-default t))

(def-package! org-super-agenda
  :after org-agenda
  :init
  (setq org-super-agenda-groups '((:name "Today"
                                         :time-grid t
                                         :scheduled today)
                                   (:name "Due Today"
                                          :deadline today)
                                   (:name "Important"
                                          :priority "A")
                                   (:name "Overdue"
                                          :deadline past)
                                   (:name "Due soon"
                                          :deadline future)
                                   (:name "Big Outcomes"
                                          :tag "bo")))
  config:
  (org-super-agenda-mode))
