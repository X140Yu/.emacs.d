
(defun xy/config-objc()

  (add-to-list
   'magic-mode-alist
   '("\\(.\\|\n\\)*@implementation" . objc-mode))

  (add-to-list
   'magic-mode-alist
   '("\\(.\\|\n\\)*@interface" . objc-mode))

  (add-to-list 'auto-mode-alist '("\\.mm\\'" . objc-mode))

  (setq-default c-basic-offset 4)
  (setq-default js-indent-level 2)

  (setq projectile-globally-ignored-file-suffixes '("*.xcuserstate" ".png" ".gif" ".pdf"))

  )

(defun xy/config-wakatime()
  (setq wakatime-api-key "20a3ed23-3b2c-4b4d-b268-14940e0fe78c")
  (setq wakatime-cli-path "/usr/local/bin/wakatime")
  (global-wakatime-mode)
  )

(defun xy/config-org()

  (load-library "find-lisp")
  (setq org-agenda-files (find-lisp-find-files "~/Dropbox/org" "\.org$"))

  (setq org-default-notes-file "~/Dropbox/org/index.org")
  ;(setq org-agenda-files '("~/Dropbox/org/index.org"))

  ;; disable evil mode in calendar-mode
  (require 'evil)
  (evil-set-initial-state 'calendar-mode 'emacs)

  (setq org-capture-templates
        (quote (("t" "todo" entry (file "~/Dropbox/org/index.org")
                 "* TODO %?\n%U\n%a\n" :clock-in t :clock-resume t)
                ("w" "work" entry (file "~/Dropbox/org/index.org")
                 "* TODO %? :work:\n%a\n" :clock-resume t)
                ("n" "note" entry (file "~/Dropbox/org/notes.org")
                 "* %? :NOTE:\n%U\n%a\n" :clock-in t :clock-resume t)
                )))
  )

(defun xy/config-window()
  ;; change window size
  (when window-system (set-frame-size (selected-frame) 130 60))
  )

(defun xy/helpers()
    )


(defun xy/load-config()
  (xy/config-objc)
  (xy/helpers)
  (xy/config-org)
  (xy/config-window)
  (xy/config-wakatime)
  )
