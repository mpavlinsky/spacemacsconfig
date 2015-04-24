;; -*- mode: dotspacemacs -*- ;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration."
  (setq-default
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (ie. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '("~/.spacemacscontrib/")
   ;; List of configuration layers to load. If it is the symbol `all' instead
   ;; of a list then all discovered layers will be installed.
   dotspacemacs-configuration-layers '(git
                                       csharp
                                       key-chord
                                       themes-megapack
                                       mythemes
                                       javascript
                                       auto-completion)
   ;; A list of packages and/or extensions that will not be install and loaded.
   dotspacemacs-excluded-packages '()
   ;; If non-nil spacemacs will delete any orphan packages, i.e. packages that
   ;; are declared in a layer which is not a member of
   ;; the list `dotspacemacs-configuration-layers'
   dotspacemacs-delete-orphan-packages nil))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; Specify the startup banner. If the value is an integer then the
   ;; banner with the corresponding index is used, if the value is `random'
   ;; then the banner is chosen randomly among the available banners, if
   ;; the value is nil then no banner is displayed.
   dotspacemacs-startup-banner 'random
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(monokai)
   
   ;; If non nil the cursor color matches the state color.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font. `powerline-scale' allows to quickly tweak the mode-line
   ;; size to make separators look not too crappy.
   dotspacemacs-default-font '("Consolas"
                               :size 16
                               :weight normal
                               :width normal
                               :powerline-scale 1.5)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`
   dotspacemacs-major-mode-leader-key ","
   ;; The command key used for Evil commands (ex-commands) and
   ;; Emacs commands (M-x).
   ;; By default the command key is `:' so ex-commands are executed like in Vim
   ;; with `:' and Emacs commands are executed with `<leader> :'.
   dotspacemacs-command-key ":"
   ;; Guide-key delay in seconds. The Guide-key is the popup buffer listing
   ;; the commands bound to the current keystrokes.
   dotspacemacs-guide-key-delay 0.4
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil ;; to boost the loading time.
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up.
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX."
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup t
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'.
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'.
   dotspacemacs-inactive-transparency 90
   ;; If non nil unicode symbols are displayed in the mode line.
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters the
   ;; point when it reaches the top or bottom of the screen.
   dotspacemacs-smooth-scrolling t
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   dotspacemacs-smartparens-strict-mode nil
   ;; If non nil advises quit functions to keep server open when quitting.
   dotspacemacs-persistent-server nil
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now.
   dotspacemacs-default-package-repository nil)
  ;; User initialization goes here
  )

(defun dotspacemacs/config ()
  "Configuration function.
 This function is called at the very end of Spacemacs initialization after
layers configuration."

  (setq powerline-default-separator 'nil)
  ;; Use j and k pressed within .15 seconds to exit insert mode
  ;; (defun mp-evil-maybe-exit (entry-key exit-key)
  ;;   (let ((modified (buffer-modified-p)))
  ;;     (insert entry-key)
  ;;     (let ((evt (read-event nil nil 0.15)))
  ;;       (cond
  ;;        ((null evt) (message ""))
  ;;        ((and (integerp evt) (char-equal evt exit-key))
  ;;         (delete-char -1)
  ;;         (set-buffer-modified-p modified)
  ;;         (push 'escape unread-command-events))
  ;;        (t (push evt unread-command-events))))))

  ;; (evil-define-command mp-evil-maybe-exit-j ()
  ;;   :repeat change
  ;;   (interactive)
  ;;   (mp-evil-maybe-exit ?j ?k))
  ;; (define-key evil-insert-state-map "j" 'mp-evil-maybe-exit-j)

  ;; (evil-define-command mp-evil-maybe-exit-k ()
  ;;   :repeat change
  ;;   (interactive)
  ;;   (mp-evil-maybe-exit ?k ?j))
  ;; (define-key evil-insert-state-map "k" 'mp-evil-maybe-exit-k)

  ;; (key-chord-mode 1)
  ;; (setq key-chord-two-keys-delay 0.05)

  ;; ;; Any prefix key, "\x" can also be triggered with the key chord "jx"
  ;; (key-chord-define evil-normal-state-map "jk" 'keyboard-quit)
  
  ;; (eval-after-load 'magit
  ;;   '(progn
  ;;      (evil-define-key 'emacs magit-commit-mode-map
  ;;        "k" 'magit-goto-previous-section
  ;;        "j" 'magit-goto-next-section)
  ;;      (evil-define-key 'emacs magit-log-mode-map
  ;;        "k" 'magit-goto-previous-section
  ;;        "j" 'magit-goto-next-section)
  ;;      (evil-define-key 'emacs magit-process-mode-map
  ;;        "k" 'magit-goto-previous-section
  ;;        "j" 'magit-goto-next-section)
  ;;      (evil-define-key 'emacs magit-branch-manager-mode-map
  ;;        "k" 'magit-goto-previous-section
  ;;        "j" 'magit-goto-next-section)
  ;;      (evil-define-key 'emacs magit-status-mode-map
  ;;        "k" 'magit-goto-previous-section
  ;;        "j" 'magit-goto-next-section)
  ;;      ))

  (setq-default omnisharp-server-executable-path "~/Projects/Misc/OmniSharpServer/OmniSharp/bin/Debug/OmniSharp.exe")

  ;; ;; Helm
  ;; (eval-after-load 'helm
  ;;   '(progn
  ;;      (define-key helm-map (kbd "s-j") 'helm-next-line)
  ;;      (define-key helm-map (kbd "s-k") 'helm-previous-line)))

  ;; ;; IDO
  ;; (defun bind-ido-keys ()
  ;; "Keybindings for ido mode."
  ;; (define-key ido-completion-map (kbd "s-j") 'ido-next-match)
  ;; (define-key ido-completion-map (kbd "s-k") 'ido-prev-match))

  ;; (add-hook 'ido-setup-hook #'bind-ido-keys)








  )



;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
