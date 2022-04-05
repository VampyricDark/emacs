;;; VampyricDark-theme.el --- VampyricDark Theme

;; Code licensed under the MIT license

;; Version: 1.0.1
;; Package-Requires: ((emacs "24.3"))
;; URL: https://github.com/VampyricDark/emacs

;;; Commentary:

;; The GNU Emacs Vampyric Dark theme is based on the Dracula theme for Emacs.
;; The original Dracula theme for Emacs can be found on https://github.com/dracula/emacs

;;; Code:
(deftheme VampyricDark)

;;;; Configuration options:

(defgroup VampyricDark nil
  "VampyricDark theme options.

The theme has to be reloaded after changing anything in this group."
  :group 'faces)

(defcustom VampyricDark-enlarge-headings t
  "Use different font sizes for some headings and titles."
  :type 'boolean
  :group 'VampyricDark)

(defcustom VampyricDark-height-title-1 1.3
  "Font size 100%."
  :type 'number
  :group 'VampyricDark)

(defcustom VampyricDark-height-title-2 1.1
  "Font size 110%."
  :type 'number
  :group 'VampyricDark)

(defcustom VampyricDark-height-title-3 1.0
  "Font size 130%."
  :type 'number
  :group 'VampyricDark)

(defcustom VampyricDark-height-doc-title 1.44
  "Font size 144%."
  :type 'number
  :group 'VampyricDark)

(defcustom VampyricDark-alternate-mode-line-and-minibuffer nil
  "Use less bold and pink in the minibuffer."
  :type 'boolean
  :group 'VampyricDark)

(defvar VampyricDark-use-24-bit-colors-on-256-colors-terms nil)

;;;; Theme definition:

;; Assigment form: VARIABLE COLOR [256-COLOR [TTY-COLOR]]
(let ((colors '(;; Upstream theme color
                (VampyricDark-bg      "#18191f" "unspecified-bg" "unspecified-bg") ; official background
                (VampyricDark-fg      "#f8f8f2" "#f8f8f2" "brightwhite") ; official foreground
                (VampyricDark-current "#383a59" "#525473" "brightblack") ; official current-line/selection
                (VampyricDark-comment "#3b3c4a" "#6E6F7D" "blue")        ; official comment
                (VampyricDark-cyan    "#54a7f0" "#87DAFF" "brightcyan")  ; official cyan
                (VampyricDark-green   "#59de47" "#73F861" "green")       ; official green
                (VampyricDark-orange  "#ffb86c" "#ffd286" "brightred")   ; official orange
                (VampyricDark-pink    "#ff59c5" "#ff8cf8" "magenta")     ; official pink
                (VampyricDark-purple  "#6550eb" "#af87ff" "brightmagenta") ; official purple
                (VampyricDark-red     "#e04848" "#ff8787" "red")         ; official red
                (VampyricDark-yellow  "#f1fa8c" "#ffff87" "yellow")      ; official yellow
                ;; Other colors
                (bg2             "#373844" "#121212" "brightblack")
                (bg3             "#464752" "#262626" "brightblack")
                (bg4             "#565761" "#444444" "brightblack")
                (fg2             "#e2e2dc" "#e4e4e4" "brightwhite")
                (fg3             "#ccccc7" "#c6c6c6" "white")
                (fg4             "#b6b6b2" "#b2b2b2" "white")
                (other-blue      "#4e72e6" "#3559CD" "brightblue")))
      (faces '(;; default / basic faces
               (cursor :background ,fg3)
               (default :background ,VampyricDark-bg :foreground ,VampyricDark-fg)
               (default-italic :slant italic)
               (error :foreground ,VampyricDark-red)
               (ffap :foreground ,fg4)
               (fringe :background ,VampyricDark-bg :foreground ,fg4)
               (header-line :background ,VampyricDark-bg)
               (highlight :foreground ,fg3 :background ,bg3)
               (hl-line :background ,VampyricDark-current :extend t)
               (info-quoted-name :foreground ,VampyricDark-orange)
               (info-string :foreground ,VampyricDark-yellow)
               (lazy-highlight :foreground ,fg2 :background ,bg2)
               (link :foreground ,VampyricDark-cyan :underline t)
               (linum :slant italic :foreground ,bg4 :background ,VampyricDark-bg)
               (line-number :slant italic :foreground ,bg4 :background ,VampyricDark-bg)
               (match :background ,VampyricDark-yellow :foreground ,VampyricDark-bg)
               (menu :background ,VampyricDark-current :inverse-video nil
                     ,@(if VampyricDark-alternate-mode-line-and-minibuffer
                           (list :foreground fg3)
                         (list :foreground VampyricDark-fg)))
               (minibuffer-prompt
                ,@(if VampyricDark-alternate-mode-line-and-minibuffer
                      (list :weight 'normal :foreground VampyricDark-fg)
                    (list :weight 'bold :foreground VampyricDark-pink)))
               (read-multiple-choice-face :inherit completions-first-difference)
               (region :inherit match :extend t)
               (shadow :foreground ,VampyricDark-comment)
               (success :foreground ,VampyricDark-green)
               (tooltip :foreground ,VampyricDark-fg :background ,VampyricDark-current)
               (trailing-whitespace :background ,VampyricDark-orange)
               (vertical-border :foreground ,bg2)
               (warning :foreground ,VampyricDark-orange)
               ;; syntax / font-lock
               (font-lock-builtin-face :foreground ,VampyricDark-cyan :slant italic)
               (font-lock-comment-face :inherit shadow)
               (font-lock-comment-delimiter-face :inherit shadow)
               (font-lock-constant-face :foreground ,VampyricDark-purple)
               (font-lock-doc-face :foreground ,VampyricDark-comment)
               (font-lock-function-name-face :foreground ,VampyricDark-green :weight bold)
               (font-lock-keyword-face :foreground ,VampyricDark-pink :weight bold)
               (font-lock-negation-char-face :foreground ,VampyricDark-cyan)
               (font-lock-preprocessor-face :foreground ,VampyricDark-orange)
               (font-lock-reference-face :inherit font-lock-constant-face) ;; obsolete
               (font-lock-regexp-grouping-backslash :foreground ,VampyricDark-cyan)
               (font-lock-regexp-grouping-construct :foreground ,VampyricDark-purple)
               (font-lock-string-face :foreground ,VampyricDark-yellow)
               (font-lock-type-face :inherit font-lock-builtin-face)
               (font-lock-variable-name-face :foreground ,VampyricDark-fg :weight bold)
               (font-lock-warning-face :inherit warning :background ,bg2)
               ;; auto-complete
               (ac-completion-face :underline t :foreground ,VampyricDark-pink)
               ;; company
               (company-echo-common :foreground ,VampyricDark-bg :background ,VampyricDark-fg)
               (company-preview :background ,VampyricDark-current :foreground ,other-blue)
               (company-preview-common :inherit company-preview
                                       :foreground ,VampyricDark-pink)
               (company-preview-search :inherit company-preview
                                       :foreground ,VampyricDark-green)
               (company-scrollbar-bg :background ,VampyricDark-comment)
               (company-scrollbar-fg :foreground ,other-blue)
               (company-tooltip :inherit tooltip)
               (company-tooltip-search :foreground ,VampyricDark-green
                                       :underline t)
               (company-tooltip-search-selection :background ,VampyricDark-green
                                                 :foreground ,VampyricDark-bg)
               (company-tooltip-selection :inherit match)
               (company-tooltip-mouse :background ,VampyricDark-bg)
               (company-tooltip-common :foreground ,VampyricDark-pink :weight bold)
               ;;(company-tooltip-common-selection :inherit company-tooltip-common)
               (company-tooltip-annotation :foreground ,VampyricDark-cyan)
               ;;(company-tooltip-annotation-selection :inherit company-tooltip-annotation)
               ;; completions (minibuffer.el)
               (completions-annotations :inherit font-lock-comment-face)
               (completions-common-part :foreground ,VampyricDark-green)
               (completions-first-difference :foreground ,VampyricDark-pink :weight bold)
               ;; diff-hl
               (diff-hl-change :foreground ,VampyricDark-orange :background ,VampyricDark-orange)
               (diff-hl-delete :foreground ,VampyricDark-red :background ,VampyricDark-red)
               (diff-hl-insert :foreground ,VampyricDark-green :background ,VampyricDark-green)
               ;; dired
               (dired-directory :foreground ,VampyricDark-green :weight normal)
               (dired-flagged :foreground ,VampyricDark-pink)
               (dired-header :foreground ,fg3 :background ,VampyricDark-bg)
               (dired-ignored :inherit shadow)
               (dired-mark :foreground ,VampyricDark-fg :weight bold)
               (dired-marked :foreground ,VampyricDark-orange :weight bold)
               (dired-perm-write :foreground ,fg3 :underline t)
               (dired-symlink :foreground ,VampyricDark-yellow :weight normal :slant italic)
               (dired-warning :foreground ,VampyricDark-orange :underline t)
               (diredp-compressed-file-name :foreground ,fg3)
               (diredp-compressed-file-suffix :foreground ,fg4)
               (diredp-date-time :foreground ,VampyricDark-fg)
               (diredp-deletion-file-name :foreground ,VampyricDark-pink :background ,VampyricDark-current)
               (diredp-deletion :foreground ,VampyricDark-pink :weight bold)
               (diredp-dir-heading :foreground ,fg2 :background ,bg4)
               (diredp-dir-name :inherit dired-directory)
               (diredp-dir-priv :inherit dired-directory)
               (diredp-executable-tag :foreground ,VampyricDark-orange)
               (diredp-file-name :foreground ,VampyricDark-fg)
               (diredp-file-suffix :foreground ,fg4)
               (diredp-flag-mark-line :foreground ,fg2 :slant italic :background ,VampyricDark-current)
               (diredp-flag-mark :foreground ,fg2 :weight bold :background ,VampyricDark-current)
               (diredp-ignored-file-name :foreground ,VampyricDark-fg)
               (diredp-mode-line-flagged :foreground ,VampyricDark-orange)
               (diredp-mode-line-marked :foreground ,VampyricDark-orange)
               (diredp-no-priv :foreground ,VampyricDark-fg)
               (diredp-number :foreground ,VampyricDark-cyan)
               (diredp-other-priv :foreground ,VampyricDark-orange)
               (diredp-rare-priv :foreground ,VampyricDark-orange)
               (diredp-read-priv :foreground ,VampyricDark-purple)
               (diredp-write-priv :foreground ,VampyricDark-pink)
               (diredp-exec-priv :foreground ,VampyricDark-yellow)
               (diredp-symlink :foreground ,VampyricDark-orange)
               (diredp-link-priv :foreground ,VampyricDark-orange)
               (diredp-autofile-name :foreground ,VampyricDark-yellow)
               (diredp-tagged-autofile-name :foreground ,VampyricDark-yellow)
               ;; elfeed
               (elfeed-search-date-face :foreground ,VampyricDark-comment)
               (elfeed-search-title-face :foreground ,VampyricDark-fg)
               (elfeed-search-unread-title-face :foreground ,VampyricDark-pink :weight bold)
               (elfeed-search-feed-face :foreground ,VampyricDark-fg :weight bold)
               (elfeed-search-tag-face :foreground ,VampyricDark-green)
               (elfeed-search-last-update-face :weight bold)
               (elfeed-search-unread-count-face :foreground ,VampyricDark-pink)
               (elfeed-search-filter-face :foreground ,VampyricDark-green :weight bold)
               ;;(elfeed-log-date-face :inherit font-lock-type-face)
               (elfeed-log-error-level-face :foreground ,VampyricDark-red)
               (elfeed-log-warn-level-face :foreground ,VampyricDark-orange)
               (elfeed-log-info-level-face :foreground ,VampyricDark-cyan)
               (elfeed-log-debug-level-face :foreground ,VampyricDark-comment)
               ;; elpher
               (elpher-gemini-heading1 :inherit bold :foreground ,VampyricDark-pink
                                       ,@(when VampyricDark-enlarge-headings
                                           (list :height VampyricDark-height-title-1)))
               (elpher-gemini-heading2 :inherit bold :foreground ,VampyricDark-purple
                                       ,@(when VampyricDark-enlarge-headings
                                           (list :height VampyricDark-height-title-2)))
               (elpher-gemini-heading3 :weight normal :foreground ,VampyricDark-green
                                       ,@(when VampyricDark-enlarge-headings
                                           (list :height VampyricDark-height-title-3)))
               (elpher-gemini-preformatted :inherit fixed-pitch
                                           :foreground ,VampyricDark-orange)
               ;; enh-ruby
               (enh-ruby-heredoc-delimiter-face :foreground ,VampyricDark-yellow)
               (enh-ruby-op-face :foreground ,VampyricDark-pink)
               (enh-ruby-regexp-delimiter-face :foreground ,VampyricDark-yellow)
               (enh-ruby-string-delimiter-face :foreground ,VampyricDark-yellow)
               ;; flyspell
               (flyspell-duplicate :underline (:style wave :color ,VampyricDark-orange))
               (flyspell-incorrect :underline (:style wave :color ,VampyricDark-red))
               ;; font-latex
               (font-latex-bold-face :foreground ,VampyricDark-purple)
               (font-latex-italic-face :foreground ,VampyricDark-pink :slant italic)
               (font-latex-match-reference-keywords :foreground ,VampyricDark-cyan)
               (font-latex-match-variable-keywords :foreground ,VampyricDark-fg)
               (font-latex-string-face :foreground ,VampyricDark-yellow)
               ;; gemini
               (gemini-heading-face-1 :inherit bold :foreground ,VampyricDark-pink
                                      ,@(when VampyricDark-enlarge-headings
                                          (list :height VampyricDark-height-title-1)))
               (gemini-heading-face-2 :inherit bold :foreground ,VampyricDark-purple
                                      ,@(when VampyricDark-enlarge-headings
                                          (list :height VampyricDark-height-title-2)))
               (gemini-heading-face-3 :weight normal :foreground ,VampyricDark-green
                                      ,@(when VampyricDark-enlarge-headings
                                          (list :height VampyricDark-height-title-3)))
               (gemini-heading-face-rest :weight normal :foreground ,VampyricDark-yellow)
               (gemini-quote-face :foreground ,VampyricDark-purple)
               ;; go-test
               (go-test--ok-face :inherit success)
               (go-test--error-face :inherit error)
               (go-test--warning-face :inherit warning)
               (go-test--pointer-face :foreground ,VampyricDark-pink)
               (go-test--standard-face :foreground ,VampyricDark-cyan)
               ;; gnus-group
               (gnus-group-mail-1 :foreground ,VampyricDark-pink :weight bold)
               (gnus-group-mail-1-empty :inherit gnus-group-mail-1 :weight normal)
               (gnus-group-mail-2 :foreground ,VampyricDark-cyan :weight bold)
               (gnus-group-mail-2-empty :inherit gnus-group-mail-2 :weight normal)
               (gnus-group-mail-3 :foreground ,VampyricDark-comment :weight bold)
               (gnus-group-mail-3-empty :inherit gnus-group-mail-3 :weight normal)
               (gnus-group-mail-low :foreground ,VampyricDark-current :weight bold)
               (gnus-group-mail-low-empty :inherit gnus-group-mail-low :weight normal)
               (gnus-group-news-1 :foreground ,VampyricDark-pink :weight bold)
               (gnus-group-news-1-empty :inherit gnus-group-news-1 :weight normal)
               (gnus-group-news-2 :foreground ,VampyricDark-cyan :weight bold)
               (gnus-group-news-2-empty :inherit gnus-group-news-2 :weight normal)
               (gnus-group-news-3 :foreground ,VampyricDark-comment :weight bold)
               (gnus-group-news-3-empty :inherit gnus-group-news-3 :weight normal)
               (gnus-group-news-4 :inherit gnus-group-news-low)
               (gnus-group-news-4-empty :inherit gnus-group-news-low-empty)
               (gnus-group-news-5 :inherit gnus-group-news-low)
               (gnus-group-news-5-empty :inherit gnus-group-news-low-empty)
               (gnus-group-news-6 :inherit gnus-group-news-low)
               (gnus-group-news-6-empty :inherit gnus-group-news-low-empty)
               (gnus-group-news-low :foreground ,VampyricDark-current :weight bold)
               (gnus-group-news-low-empty :inherit gnus-group-news-low :weight normal)
               (gnus-header-content :foreground ,VampyricDark-purple)
               (gnus-header-from :foreground ,VampyricDark-fg)
               (gnus-header-name :foreground ,VampyricDark-green)
               (gnus-header-subject :foreground ,VampyricDark-pink :weight bold)
               (gnus-summary-markup-face :foreground ,VampyricDark-cyan)
               (gnus-summary-high-unread :foreground ,VampyricDark-pink :weight bold)
               (gnus-summary-high-read :inherit gnus-summary-high-unread :weight normal)
               (gnus-summary-high-ancient :inherit gnus-summary-high-read)
               (gnus-summary-high-ticked :inherit gnus-summary-high-read :underline t)
               (gnus-summary-normal-unread :foreground ,other-blue :weight bold)
               (gnus-summary-normal-read :foreground ,VampyricDark-comment :weight normal)
               (gnus-summary-normal-ancient :inherit gnus-summary-normal-read :weight light)
               (gnus-summary-normal-ticked :foreground ,VampyricDark-pink :weight bold)
               (gnus-summary-low-unread :foreground ,VampyricDark-comment :weight bold)
               (gnus-summary-low-read :inherit gnus-summary-low-unread :weight normal)
               (gnus-summary-low-ancient :inherit gnus-summary-low-read)
               (gnus-summary-low-ticked :inherit gnus-summary-low-read :underline t)
               (gnus-summary-selected :inverse-video t)
               ;; haskell-mode
               (haskell-operator-face :foreground ,VampyricDark-pink)
               (haskell-constructor-face :foreground ,VampyricDark-purple)
               ;; helm
               (helm-bookmark-w3m :foreground ,VampyricDark-purple)
               (helm-buffer-not-saved :foreground ,VampyricDark-purple :background ,VampyricDark-bg)
               (helm-buffer-process :foreground ,VampyricDark-orange :background ,VampyricDark-bg)
               (helm-buffer-saved-out :foreground ,VampyricDark-fg :background ,VampyricDark-bg)
               (helm-buffer-size :foreground ,VampyricDark-fg :background ,VampyricDark-bg)
               (helm-candidate-number :foreground ,VampyricDark-bg :background ,VampyricDark-fg)
               (helm-ff-directory :foreground ,VampyricDark-green :background ,VampyricDark-bg :weight bold)
               (helm-ff-dotted-directory :foreground ,VampyricDark-green :background ,VampyricDark-bg :weight normal)
               (helm-ff-executable :foreground ,other-blue :background ,VampyricDark-bg :weight normal)
               (helm-ff-file :foreground ,VampyricDark-fg :background ,VampyricDark-bg :weight normal)
               (helm-ff-invalid-symlink :foreground ,VampyricDark-pink :background ,VampyricDark-bg :weight bold)
               (helm-ff-prefix :foreground ,VampyricDark-bg :background ,VampyricDark-pink :weight normal)
               (helm-ff-symlink :foreground ,VampyricDark-pink :background ,VampyricDark-bg :weight bold)
               (helm-grep-cmd-line :foreground ,VampyricDark-fg :background ,VampyricDark-bg)
               (helm-grep-file :foreground ,VampyricDark-fg :background ,VampyricDark-bg)
               (helm-grep-finish :foreground ,fg2 :background ,VampyricDark-bg)
               (helm-grep-lineno :foreground ,VampyricDark-fg :background ,VampyricDark-bg)
               (helm-grep-match :inherit match)
               (helm-grep-running :foreground ,VampyricDark-green :background ,VampyricDark-bg)
               (helm-header :foreground ,fg2 :background ,VampyricDark-bg :underline nil :box nil)
               (helm-moccur-buffer :foreground ,VampyricDark-green :background ,VampyricDark-bg)
               (helm-selection :background ,bg2 :underline nil)
               (helm-selection-line :background ,bg2)
               (helm-separator :foreground ,VampyricDark-purple :background ,VampyricDark-bg)
               (helm-source-go-package-godoc-description :foreground ,VampyricDark-yellow)
               (helm-source-header :foreground ,VampyricDark-pink :background ,VampyricDark-bg :underline nil :weight bold)
               (helm-time-zone-current :foreground ,VampyricDark-orange :background ,VampyricDark-bg)
               (helm-time-zone-home :foreground ,VampyricDark-purple :background ,VampyricDark-bg)
               (helm-visible-mark :foreground ,VampyricDark-bg :background ,bg3)
               ;; highlight-indentation minor mode
               (highlight-indentation-face :background ,bg2)
               ;; icicle
               (icicle-whitespace-highlight :background ,VampyricDark-fg)
               (icicle-special-candidate :foreground ,fg2)
               (icicle-extra-candidate :foreground ,fg2)
               (icicle-search-main-regexp-others :foreground ,VampyricDark-fg)
               (icicle-search-current-input :foreground ,VampyricDark-pink)
               (icicle-search-context-level-8 :foreground ,VampyricDark-orange)
               (icicle-search-context-level-7 :foreground ,VampyricDark-orange)
               (icicle-search-context-level-6 :foreground ,VampyricDark-orange)
               (icicle-search-context-level-5 :foreground ,VampyricDark-orange)
               (icicle-search-context-level-4 :foreground ,VampyricDark-orange)
               (icicle-search-context-level-3 :foreground ,VampyricDark-orange)
               (icicle-search-context-level-2 :foreground ,VampyricDark-orange)
               (icicle-search-context-level-1 :foreground ,VampyricDark-orange)
               (icicle-search-main-regexp-current :foreground ,VampyricDark-fg)
               (icicle-saved-candidate :foreground ,VampyricDark-fg)
               (icicle-proxy-candidate :foreground ,VampyricDark-fg)
               (icicle-mustmatch-completion :foreground ,VampyricDark-purple)
               (icicle-multi-command-completion :foreground ,fg2 :background ,bg2)
               (icicle-msg-emphasis :foreground ,VampyricDark-green)
               (icicle-mode-line-help :foreground ,fg4)
               (icicle-match-highlight-minibuffer :foreground ,VampyricDark-orange)
               (icicle-match-highlight-Completions :foreground ,VampyricDark-green)
               (icicle-key-complete-menu-local :foreground ,VampyricDark-fg)
               (icicle-key-complete-menu :foreground ,VampyricDark-fg)
               (icicle-input-completion-fail-lax :foreground ,VampyricDark-pink)
               (icicle-input-completion-fail :foreground ,VampyricDark-pink)
               (icicle-historical-candidate-other :foreground ,VampyricDark-fg)
               (icicle-historical-candidate :foreground ,VampyricDark-fg)
               (icicle-current-candidate-highlight :foreground ,VampyricDark-orange :background ,bg3)
               (icicle-Completions-instruction-2 :foreground ,fg4)
               (icicle-Completions-instruction-1 :foreground ,fg4)
               (icicle-completion :foreground ,VampyricDark-fg)
               (icicle-complete-input :foreground ,VampyricDark-orange)
               (icicle-common-match-highlight-Completions :foreground ,VampyricDark-purple)
               (icicle-candidate-part :foreground ,VampyricDark-fg)
               (icicle-annotation :foreground ,fg4)
               ;; icomplete
               (icompletep-determined :foreground ,VampyricDark-orange)
               ;; ido
               (ido-first-match
                ,@(if VampyricDark-alternate-mode-line-and-minibuffer
                      (list :weight 'normal :foreground VampyricDark-green)
                    (list :weight 'bold :foreground VampyricDark-pink)))
               (ido-only-match :foreground ,VampyricDark-orange)
               (ido-subdir :foreground ,VampyricDark-yellow)
               (ido-virtual :foreground ,VampyricDark-cyan)
               (ido-incomplete-regexp :inherit font-lock-warning-face)
               (ido-indicator :foreground ,VampyricDark-fg :background ,VampyricDark-pink)
               ;; ivy
               (ivy-current-match
                ,@(if VampyricDark-alternate-mode-line-and-minibuffer
                      (list :weight 'normal :background VampyricDark-current :foreground VampyricDark-green)
                    (list :weight 'bold :background VampyricDark-current :foreground VampyricDark-pink)))
               ;; Highlights the background of the match.
               (ivy-minibuffer-match-face-1 :background ,VampyricDark-current)
               ;; Highlights the first matched group.
               (ivy-minibuffer-match-face-2 :background ,VampyricDark-green
                                            :foreground ,VampyricDark-bg)
               ;; Highlights the second matched group.
               (ivy-minibuffer-match-face-3 :background ,VampyricDark-yellow
                                            :foreground ,VampyricDark-bg)
               ;; Highlights the third matched group.
               (ivy-minibuffer-match-face-4 :background ,VampyricDark-pink
                                            :foreground ,VampyricDark-bg)
               (ivy-confirm-face :foreground ,VampyricDark-orange)
               (ivy-match-required-face :foreground ,VampyricDark-red)
               (ivy-subdir :foreground ,VampyricDark-yellow)
               (ivy-remote :foreground ,VampyricDark-pink)
               (ivy-virtual :foreground ,VampyricDark-cyan)
               ;; isearch
               (isearch :inherit match :weight bold)
               (isearch-fail :foreground ,VampyricDark-bg :background ,VampyricDark-orange)
               ;; jde-java
               (jde-java-font-lock-constant-face :foreground ,VampyricDark-cyan)
               (jde-java-font-lock-modifier-face :foreground ,VampyricDark-pink)
               (jde-java-font-lock-number-face :foreground ,VampyricDark-fg)
               (jde-java-font-lock-package-face :foreground ,VampyricDark-fg)
               (jde-java-font-lock-private-face :foreground ,VampyricDark-pink)
               (jde-java-font-lock-public-face :foreground ,VampyricDark-pink)
               ;; js2-mode
               (js2-external-variable :foreground ,VampyricDark-purple)
               (js2-function-param :foreground ,VampyricDark-cyan)
               (js2-jsdoc-html-tag-delimiter :foreground ,VampyricDark-yellow)
               (js2-jsdoc-html-tag-name :foreground ,other-blue)
               (js2-jsdoc-value :foreground ,VampyricDark-yellow)
               (js2-private-function-call :foreground ,VampyricDark-cyan)
               (js2-private-member :foreground ,fg3)
               ;; js3-mode
               (js3-error-face :underline ,VampyricDark-orange)
               (js3-external-variable-face :foreground ,VampyricDark-fg)
               (js3-function-param-face :foreground ,VampyricDark-pink)
               (js3-instance-member-face :foreground ,VampyricDark-cyan)
               (js3-jsdoc-tag-face :foreground ,VampyricDark-pink)
               (js3-warning-face :underline ,VampyricDark-pink)
               ;; lsp
               (lsp-ui-peek-peek :background ,VampyricDark-bg)
               (lsp-ui-peek-list :background ,bg2)
               (lsp-ui-peek-filename :foreground ,VampyricDark-pink :weight bold)
               (lsp-ui-peek-line-number :foreground ,VampyricDark-fg)
               (lsp-ui-peek-highlight :inherit highlight :distant-foreground ,VampyricDark-bg)
               (lsp-ui-peek-header :background ,bg3 :foreground ,fg3, :weight bold)
               (lsp-ui-peek-footer :inherit lsp-ui-peek-header)
               (lsp-ui-peek-selection :inherit match)
               (lsp-ui-sideline-symbol :foreground ,fg4 :box (:line-width -1 :color ,fg4) :height 0.99)
               (lsp-ui-sideline-current-symbol :foreground ,VampyricDark-fg :weight ultra-bold
                                               :box (:line-width -1 :color VampyricDark-fg) :height 0.99)
               (lsp-ui-sideline-code-action :foreground ,VampyricDark-yellow)
               (lsp-ui-sideline-symbol-info :slant italic :height 0.99)
               (lsp-ui-doc-background :background ,VampyricDark-bg)
               (lsp-ui-doc-header :foreground ,VampyricDark-bg :background ,VampyricDark-cyan)
               ;; magit
               (magit-branch-local :foreground ,VampyricDark-cyan)
               (magit-branch-remote :foreground ,VampyricDark-green)
               (magit-tag :foreground ,VampyricDark-orange)
               (magit-section-heading :foreground ,VampyricDark-pink :weight bold)
               (magit-section-highlight :background ,bg3 :extend t)
               (magit-diff-context-highlight :background ,bg3
                                             :foreground ,fg3
                                             :extend t)
               (magit-diff-revision-summary :foreground ,VampyricDark-orange
                                            :background ,VampyricDark-bg
                                            :weight bold)
               (magit-diff-revision-summary-highlight :foreground ,VampyricDark-orange
                                                      :background ,bg3
                                                      :weight bold
                                                      :extend t)
               ;; the four following lines are just a patch of the
               ;; upstream color to add the extend keyword.
               (magit-diff-added :background "#335533"
                                 :foreground "#ddffdd"
                                 :extend t)
               (magit-diff-added-highlight :background "#336633"
                                           :foreground "#cceecc"
                                           :extend t)
               (magit-diff-removed :background "#553333"
                                   :foreground "#ffdddd"
                                   :extend t)
               (magit-diff-removed-highlight :background "#663333"
                                             :foreground "#eecccc"
                                             :extend t)
               (magit-diff-file-heading :foreground ,VampyricDark-fg)
               (magit-diff-file-heading-highlight :inherit magit-section-highlight)
               (magit-diffstat-added :foreground ,VampyricDark-green)
               (magit-diffstat-removed :foreground ,VampyricDark-red)
               (magit-hash :foreground ,fg2)
               (magit-hunk-heading :background ,bg3)
               (magit-hunk-heading-highlight :background ,bg3)
               (magit-item-highlight :background ,bg3)
               (magit-log-author :foreground ,fg3)
               (magit-process-ng :foreground ,VampyricDark-orange :weight bold)
               (magit-process-ok :foreground ,VampyricDark-green :weight bold)
               ;; markdown
               (markdown-blockquote-face :foreground ,VampyricDark-yellow
                                         :slant italic)
               (markdown-code-face :foreground ,VampyricDark-orange)
               (markdown-footnote-face :foreground ,other-blue)
               (markdown-header-face :weight normal)
               (markdown-header-face-1
                :inherit bold :foreground ,VampyricDark-pink
                ,@(when VampyricDark-enlarge-headings
                    (list :height VampyricDark-height-title-1)))
               (markdown-header-face-2
                :inherit bold :foreground ,VampyricDark-purple
                ,@(when VampyricDark-enlarge-headings
                    (list :height VampyricDark-height-title-2)))
               (markdown-header-face-3
                :foreground ,VampyricDark-green
                ,@(when VampyricDark-enlarge-headings
                    (list :height VampyricDark-height-title-3)))
               (markdown-header-face-4 :foreground ,VampyricDark-yellow)
               (markdown-header-face-5 :foreground ,VampyricDark-cyan)
               (markdown-header-face-6 :foreground ,VampyricDark-orange)
               (markdown-header-face-7 :foreground ,other-blue)
               (markdown-header-face-8 :foreground ,VampyricDark-fg)
               (markdown-inline-code-face :foreground ,VampyricDark-green)
               (markdown-plain-url-face :inherit link)
               (markdown-pre-face :foreground ,VampyricDark-orange)
               (markdown-table-face :foreground ,VampyricDark-purple)
               (markdown-list-face :foreground ,VampyricDark-cyan)
               (markdown-language-keyword-face :foreground ,VampyricDark-comment)
               ;; message
               (message-header-to :foreground ,VampyricDark-fg :weight bold)
               (message-header-cc :foreground ,VampyricDark-fg :bold bold)
               (message-header-subject :foreground ,VampyricDark-orange)
               (message-header-newsgroups :foreground ,VampyricDark-purple)
               (message-header-other :foreground ,VampyricDark-purple)
               (message-header-name :foreground ,VampyricDark-green)
               (message-header-xheader :foreground ,VampyricDark-cyan)
               (message-separator :foreground ,VampyricDark-cyan :slant italic)
               (message-cited-text :foreground ,VampyricDark-purple)
               (message-cited-text-1 :foreground ,VampyricDark-purple)
               (message-cited-text-2 :foreground ,VampyricDark-orange)
               (message-cited-text-3 :foreground ,VampyricDark-comment)
               (message-cited-text-4 :foreground ,fg2)
               (message-mml :foreground ,VampyricDark-green :weight normal)
               ;; mode-line
               (mode-line :background ,VampyricDark-current
                          :box ,VampyricDark-current :inverse-video nil
                          ,@(if VampyricDark-alternate-mode-line-and-minibuffer
                                (list :foreground fg3)
                              (list :foreground VampyricDark-fg)))
               (mode-line-inactive
                :background ,VampyricDark-bg :inverse-video nil
                ,@(if VampyricDark-alternate-mode-line-and-minibuffer
                      (list :foreground VampyricDark-comment :box VampyricDark-bg)
                    (list :foreground fg4 :box bg2)))
               (mini-modeline-mode-line :inherit mode-line :height 0.1 :box nil)
               ;; mu4e
               (mu4e-unread-face :foreground ,VampyricDark-pink :weight normal)
               (mu4e-view-url-number-face :foreground ,VampyricDark-purple)
               (mu4e-highlight-face :background ,VampyricDark-bg
                                    :foreground ,VampyricDark-yellow
                                    :extend t)
               (mu4e-header-highlight-face :background ,VampyricDark-current
                                           :foreground ,VampyricDark-fg
                                           :underline nil :weight bold
                                           :extend t)
               (mu4e-header-key-face :inherit message-mml)
               (mu4e-header-marks-face :foreground ,VampyricDark-purple)
               (mu4e-cited-1-face :foreground ,VampyricDark-purple)
               (mu4e-cited-2-face :foreground ,VampyricDark-orange)
               (mu4e-cited-3-face :foreground ,VampyricDark-comment)
               (mu4e-cited-4-face :foreground ,fg2)
               (mu4e-cited-5-face :foreground ,fg3)
               ;; neotree
               (neo-banner-face :foreground ,VampyricDark-orange :weight bold)
               ;;(neo-button-face :underline nil)
               (neo-dir-link-face :foreground ,VampyricDark-purple)
               (neo-expand-btn-face :foreground ,VampyricDark-fg)
               (neo-file-link-face :foreground ,VampyricDark-cyan)
               (neo-header-face :background ,VampyricDark-bg
                                :foreground ,VampyricDark-fg
                                :weight bold)
               (neo-root-dir-face :foreground ,VampyricDark-purple :weight bold)
               (neo-vc-added-face :foreground ,VampyricDark-orange)
               (neo-vc-conflict-face :foreground ,VampyricDark-red)
               (neo-vc-default-face :inherit neo-file-link-face)
               (neo-vc-edited-face :foreground ,VampyricDark-orange)
               (neo-vc-ignored-face :foreground ,VampyricDark-comment)
               (neo-vc-missing-face :foreground ,VampyricDark-red)
               (neo-vc-needs-merge-face :foreground ,VampyricDark-red
                                        :weight bold)
               ;;(neo-vc-needs-update-face :underline t)
               ;;(neo-vc-removed-face :strike-through t)
               (neo-vc-unlocked-changes-face :foreground ,VampyricDark-red)
               ;;(neo-vc-unregistered-face nil)
               (neo-vc-up-to-date-face :foreground ,VampyricDark-green)
               (neo-vc-user-face :foreground ,VampyricDark-purple)
               ;; org
               (org-agenda-date :foreground ,VampyricDark-cyan :underline nil)
               (org-agenda-dimmed-todo-face :foreground ,VampyricDark-comment)
               (org-agenda-done :foreground ,VampyricDark-green)
               (org-agenda-structure :foreground ,VampyricDark-purple)
               (org-block :foreground ,VampyricDark-orange)
               (org-code :foreground ,VampyricDark-green)
               (org-column :background ,bg4)
               (org-column-title :inherit org-column :weight bold :underline t)
               (org-date :foreground ,VampyricDark-cyan :underline t)
               (org-document-info :foreground ,other-blue)
               (org-document-info-keyword :foreground ,VampyricDark-comment)
               (org-document-title :weight bold :foreground ,VampyricDark-orange
                                   ,@(when VampyricDark-enlarge-headings
                                       (list :height VampyricDark-height-doc-title)))
               (org-done :foreground ,VampyricDark-green)
               (org-ellipsis :foreground ,VampyricDark-comment)
               (org-footnote :foreground ,other-blue)
               (org-formula :foreground ,VampyricDark-pink)
               (org-headline-done :foreground ,VampyricDark-comment
                                  :weight normal :strike-through t)
               (org-hide :foreground ,VampyricDark-bg :background ,VampyricDark-bg)
               (org-level-1 :inherit bold :foreground ,VampyricDark-pink
                            ,@(when VampyricDark-enlarge-headings
                                (list :height VampyricDark-height-title-1)))
               (org-level-2 :inherit bold :foreground ,VampyricDark-purple
                            ,@(when VampyricDark-enlarge-headings
                                (list :height VampyricDark-height-title-2)))
               (org-level-3 :weight normal :foreground ,VampyricDark-green
                            ,@(when VampyricDark-enlarge-headings
                                (list :height VampyricDark-height-title-3)))
               (org-level-4 :weight normal :foreground ,VampyricDark-yellow)
               (org-level-5 :weight normal :foreground ,VampyricDark-cyan)
               (org-level-6 :weight normal :foreground ,VampyricDark-orange)
               (org-level-7 :weight normal :foreground ,other-blue)
               (org-level-8 :weight normal :foreground ,VampyricDark-fg)
               (org-link :foreground ,VampyricDark-cyan :underline t)
               (org-priority :foreground ,VampyricDark-cyan)
               (org-quote :foreground ,VampyricDark-yellow :slant italic)
               (org-scheduled :foreground ,VampyricDark-green)
               (org-scheduled-previously :foreground ,VampyricDark-yellow)
               (org-scheduled-today :foreground ,VampyricDark-green)
               (org-sexp-date :foreground ,fg4)
               (org-special-keyword :foreground ,VampyricDark-yellow)
               (org-table :foreground ,VampyricDark-purple)
               (org-tag :foreground ,VampyricDark-pink :weight bold :background ,bg2)
               (org-todo :foreground ,VampyricDark-orange :weight bold :background ,bg2)
               (org-upcoming-deadline :foreground ,VampyricDark-yellow)
               (org-verbatim :inherit org-quote)
               (org-warning :weight bold :foreground ,VampyricDark-pink)
               ;; outline
               (outline-1 :foreground ,VampyricDark-pink)
               (outline-2 :foreground ,VampyricDark-purple)
               (outline-3 :foreground ,VampyricDark-green)
               (outline-4 :foreground ,VampyricDark-yellow)
               (outline-5 :foreground ,VampyricDark-cyan)
               (outline-6 :foreground ,VampyricDark-orange)
               ;; perspective
               (persp-selected-face :weight bold :foreground ,VampyricDark-pink)
               ;; powerline
               (powerline-active1 :background ,VampyricDark-bg :foreground ,VampyricDark-pink)
               (powerline-active2 :background ,VampyricDark-bg :foreground ,VampyricDark-pink)
               (powerline-inactive1 :background ,bg2 :foreground ,VampyricDark-purple)
               (powerline-inactive2 :background ,bg2 :foreground ,VampyricDark-purple)
               (powerline-evil-base-face :foreground ,bg2)
               (powerline-evil-emacs-face :inherit powerline-evil-base-face :background ,VampyricDark-yellow)
               (powerline-evil-insert-face :inherit powerline-evil-base-face :background ,VampyricDark-cyan)
               (powerline-evil-motion-face :inherit powerline-evil-base-face :background ,VampyricDark-purple)
               (powerline-evil-normal-face :inherit powerline-evil-base-face :background ,VampyricDark-green)
               (powerline-evil-operator-face :inherit powerline-evil-base-face :background ,VampyricDark-pink)
               (powerline-evil-replace-face :inherit powerline-evil-base-face :background ,VampyricDark-red)
               (powerline-evil-visual-face :inherit powerline-evil-base-face :background ,VampyricDark-orange)
               ;; rainbow-delimiters
               (rainbow-delimiters-depth-1-face :foreground ,VampyricDark-fg)
               (rainbow-delimiters-depth-2-face :foreground ,VampyricDark-cyan)
               (rainbow-delimiters-depth-3-face :foreground ,VampyricDark-purple)
               (rainbow-delimiters-depth-4-face :foreground ,VampyricDark-pink)
               (rainbow-delimiters-depth-5-face :foreground ,VampyricDark-orange)
               (rainbow-delimiters-depth-6-face :foreground ,VampyricDark-green)
               (rainbow-delimiters-depth-7-face :foreground ,VampyricDark-yellow)
               (rainbow-delimiters-depth-8-face :foreground ,other-blue)
               (rainbow-delimiters-unmatched-face :foreground ,VampyricDark-orange)
               ;; rpm-spec
               (rpm-spec-dir-face :foreground ,VampyricDark-green)
               (rpm-spec-doc-face :foreground ,VampyricDark-pink)
               (rpm-spec-ghost-face :foreground ,VampyricDark-purple)
               (rpm-spec-macro-face :foreground ,VampyricDark-yellow)
               (rpm-spec-obsolete-tag-face :inherit font-lock-warning-face)
               (rpm-spec-package-face :foreground ,VampyricDark-purple)
               (rpm-spec-section-face :foreground ,VampyricDark-yellow)
               (rpm-spec-tag-face :foreground ,VampyricDark-cyan)
               (rpm-spec-var-face :foreground ,VampyricDark-orange)
               ;; rst (reStructuredText)
               (rst-level-1 :foreground ,VampyricDark-pink :weight bold)
               (rst-level-2 :foreground ,VampyricDark-purple :weight bold)
               (rst-level-3 :foreground ,VampyricDark-green)
               (rst-level-4 :foreground ,VampyricDark-yellow)
               (rst-level-5 :foreground ,VampyricDark-cyan)
               (rst-level-6 :foreground ,VampyricDark-orange)
               (rst-level-7 :foreground ,other-blue)
               (rst-level-8 :foreground ,VampyricDark-fg)
               ;; selectrum-mode
               (selectrum-current-candidate :weight bold)
               (selectrum-primary-highlight :foreground ,VampyricDark-pink)
               (selectrum-secondary-highlight :foreground ,VampyricDark-green)
               ;; show-paren
               (show-paren-match-face :background unspecified
                                      :foreground ,VampyricDark-cyan
                                      :weight bold)
               (show-paren-match :background unspecified
                                 :foreground ,VampyricDark-cyan
                                 :weight bold)
               (show-paren-match-expression :inherit match)
               (show-paren-mismatch :inherit font-lock-warning-face)
               ;; slime
               (slime-repl-inputed-output-face :foreground ,VampyricDark-purple)
               ;; spam
               (spam :inherit gnus-summary-normal-read :foreground ,VampyricDark-orange
                     :strike-through t :slant oblique)
               ;; speedbar (and sr-speedbar)
               (speedbar-button-face :foreground ,VampyricDark-green)
               (speedbar-file-face :foreground ,VampyricDark-cyan)
               (speedbar-directory-face :foreground ,VampyricDark-purple)
               (speedbar-tag-face :foreground ,VampyricDark-yellow)
               (speedbar-selected-face :foreground ,VampyricDark-pink)
               (speedbar-highlight-face :inherit match)
               (speedbar-separator-face :background ,VampyricDark-bg
                                        :foreground ,VampyricDark-fg
                                        :weight bold)
               ;; tab-bar & tab-line (since Emacs 27.1)
               (tab-bar :foreground ,VampyricDark-purple :background ,VampyricDark-current
                        :inherit variable-pitch)
               (tab-bar-tab :foreground ,VampyricDark-pink :background ,VampyricDark-bg
                            :box (:line-width 2 :color ,VampyricDark-bg :style nil))
               (tab-bar-tab-inactive :foreground ,VampyricDark-purple :background ,bg2
                                     :box (:line-width 2 :color ,bg2 :style nil))
               (tab-line :foreground ,VampyricDark-purple :background ,VampyricDark-current
                         :height 0.9 :inherit variable-pitch)
               (tab-line-tab :foreground ,VampyricDark-pink :background ,VampyricDark-bg
                             :box (:line-width 2 :color ,VampyricDark-bg :style nil))
               (tab-line-tab-inactive :foreground ,VampyricDark-purple :background ,bg2
                                      :box (:line-width 2 :color ,bg2 :style nil))
               (tab-line-tab-current :inherit tab-line-tab)
               (tab-line-close-highlight :foreground ,VampyricDark-red)
               ;; telephone-line
               (telephone-line-accent-active :background ,VampyricDark-bg :foreground ,VampyricDark-pink)
               (telephone-line-accent-inactive :background ,bg2 :foreground ,VampyricDark-purple)
               (telephone-line-unimportant :background ,VampyricDark-bg :foreground ,VampyricDark-comment)
               ;; term
               (term :foreground ,VampyricDark-fg :background ,VampyricDark-bg)
               (term-color-black :foreground ,VampyricDark-bg :background ,VampyricDark-comment)
               (term-color-blue :foreground ,VampyricDark-purple :background ,VampyricDark-purple)
               (term-color-cyan :foreground ,VampyricDark-cyan :background ,VampyricDark-cyan)
               (term-color-green :foreground ,VampyricDark-green :background ,VampyricDark-green)
               (term-color-magenta :foreground ,VampyricDark-pink :background ,VampyricDark-pink)
               (term-color-red :foreground ,VampyricDark-red :background ,VampyricDark-red)
               (term-color-white :foreground ,VampyricDark-fg :background ,VampyricDark-fg)
               (term-color-yellow :foreground ,VampyricDark-yellow :background ,VampyricDark-yellow)
               ;; tree-sitter
               (tree-sitter-hl-face:attribute :inherit font-lock-constant-face)
               (tree-sitter-hl-face:comment :inherit font-lock-comment-face)
               (tree-sitter-hl-face:constant :inherit font-lock-constant-face)
               (tree-sitter-hl-face:constant.builtin :inherit font-lock-builtin-face)
               (tree-sitter-hl-face:constructor :inherit font-lock-constant-face)
               (tree-sitter-hl-face:escape :foreground ,VampyricDark-pink)
               (tree-sitter-hl-face:function :inherit font-lock-function-name-face)
               (tree-sitter-hl-face:function.builtin :inherit font-lock-builtin-face)
               (tree-sitter-hl-face:function.call :inherit font-lock-function-name-face
                                                  :weight normal)
               (tree-sitter-hl-face:function.macro :inherit font-lock-preprocessor-face)
               (tree-sitter-hl-face:function.special :inherit font-lock-preprocessor-face)
               (tree-sitter-hl-face:keyword :inherit font-lock-keyword-face)
               (tree-sitter-hl-face:punctuation :foreground ,VampyricDark-pink)
               (tree-sitter-hl-face:punctuation.bracket :foreground ,VampyricDark-fg)
               (tree-sitter-hl-face:punctuation.delimiter :foreground ,VampyricDark-fg)
               (tree-sitter-hl-face:punctuation.special :foreground ,VampyricDark-pink)
               (tree-sitter-hl-face:string :inherit font-lock-string-face)
               (tree-sitter-hl-face:string.special :foreground ,VampyricDark-red)
               (tree-sitter-hl-face:tag :inherit font-lock-keyword-face)
               (tree-sitter-hl-face:type :inherit font-lock-type-face)
               (tree-sitter-hl-face:type.parameter :foreground ,VampyricDark-pink)
               (tree-sitter-hl-face:variable :inherit font-lock-variable-name-face)
               (tree-sitter-hl-face:variable.parameter :inherit tree-sitter-hl-face:variable
                                                       :weight normal)
               ;; undo-tree
               (undo-tree-visualizer-current-face :foreground ,VampyricDark-orange)
               (undo-tree-visualizer-default-face :foreground ,fg2)
               (undo-tree-visualizer-register-face :foreground ,VampyricDark-purple)
               (undo-tree-visualizer-unmodified-face :foreground ,VampyricDark-fg)
               ;; web-mode
               (web-mode-builtin-face :inherit font-lock-builtin-face)
               (web-mode-comment-face :inherit font-lock-comment-face)
               (web-mode-constant-face :inherit font-lock-constant-face)
               (web-mode-css-property-name-face :inherit font-lock-constant-face)
               (web-mode-doctype-face :inherit font-lock-comment-face)
               (web-mode-function-name-face :inherit font-lock-function-name-face)
               (web-mode-html-attr-name-face :foreground ,VampyricDark-purple)
               (web-mode-html-attr-value-face :foreground ,VampyricDark-green)
               (web-mode-html-tag-face :foreground ,VampyricDark-pink :weight bold)
               (web-mode-keyword-face :foreground ,VampyricDark-pink)
               (web-mode-string-face :foreground ,VampyricDark-yellow)
               (web-mode-type-face :inherit font-lock-type-face)
               (web-mode-warning-face :inherit font-lock-warning-face)
               ;; which-func
               (which-func :inherit font-lock-function-name-face)
               ;; which-key
               (which-key-key-face :inherit font-lock-builtin-face)
               (which-key-command-description-face :inherit default)
               (which-key-separator-face :inherit font-lock-comment-delimiter-face)
               (which-key-local-map-description-face :foreground ,VampyricDark-green)
               ;; whitespace
               (whitespace-big-indent :background ,VampyricDark-red :foreground ,VampyricDark-red)
               (whitespace-empty :background ,VampyricDark-orange :foreground ,VampyricDark-red)
               (whitespace-hspace :background ,bg3 :foreground ,VampyricDark-comment)
               (whitespace-indentation :background ,VampyricDark-orange :foreground ,VampyricDark-red)
               (whitespace-line :background ,VampyricDark-bg :foreground ,VampyricDark-pink)
               (whitespace-newline :foreground ,VampyricDark-comment)
               (whitespace-space :background ,VampyricDark-bg :foreground ,VampyricDark-comment)
               (whitespace-space-after-tab :background ,VampyricDark-orange :foreground ,VampyricDark-red)
               (whitespace-space-before-tab :background ,VampyricDark-orange :foreground ,VampyricDark-red)
               (whitespace-tab :background ,bg2 :foreground ,VampyricDark-comment)
               (whitespace-trailing :inherit trailing-whitespace)
               ;; yard-mode
               (yard-tag-face :inherit font-lock-builtin-face)
               (yard-directive-face :inherit font-lock-builtin-face))))

  (apply #'custom-theme-set-faces
         'VampyricDark
         (let ((expand-with-func
                (lambda (func spec)
                  (let (reduced-color-list)
                    (dolist (col colors reduced-color-list)
                      (push (list (car col) (funcall func col))
                            reduced-color-list))
                    (eval `(let ,reduced-color-list
                             (backquote ,spec))))))
               whole-theme)
           (pcase-dolist (`(,face . ,spec) faces)
             (push `(,face
                     ((((min-colors 16777216)) ; fully graphical envs
                       ,(funcall expand-with-func 'cadr spec))
                      (((min-colors 256))      ; terminal withs 256 colors
                       ,(if VampyricDark-use-24-bit-colors-on-256-colors-terms
                            (funcall expand-with-func 'cadr spec)
                          (funcall expand-with-func 'caddr spec)))
                      (t                       ; should be only tty-like envs
                       ,(funcall expand-with-func 'cadddr spec))))
                   whole-theme))
           whole-theme))

  (apply #'custom-theme-set-variables
         'VampyricDark
         (let ((get-func
                (pcase (display-color-cells)
                  ((pred (<= 16777216)) 'car) ; fully graphical envs
                  ((pred (<= 256)) 'cadr)     ; terminal withs 256 colors
                  (_ 'caddr))))               ; should be only tty-like envs
           `((ansi-color-names-vector
              [,(funcall get-func (alist-get 'VampyricDark-bg colors))
               ,(funcall get-func (alist-get 'VampyricDark-red colors))
               ,(funcall get-func (alist-get 'VampyricDark-green colors))
               ,(funcall get-func (alist-get 'VampyricDark-yellow colors))
               ,(funcall get-func (alist-get 'VampyricDark-comment colors))
               ,(funcall get-func (alist-get 'VampyricDark-purple colors))
               ,(funcall get-func (alist-get 'VampyricDark-cyan colors))
               ,(funcall get-func (alist-get 'VampyricDark-fg colors))])))))


;;;###autoload
(when load-file-name
  (add-to-list 'custom-theme-load-path
               (file-name-as-directory (file-name-directory load-file-name))))

(provide-theme 'VampyricDark)

;; Local Variables:
;; indent-tabs-mode: nil
;; End:

;;; VampyricDark-theme.el ends here
