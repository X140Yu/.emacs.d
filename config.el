
(defun xy/config-objc()

  (add-to-list
   'magic-mode-alist
   '("\\(.\\|\n\\)*@implementation" . objc-mode))

  (add-to-list
   'magic-mode-alist
   '("\\(.\\|\n\\)*@interface" . objc-mode))

  (add-to-list 'auto-mode-alist '("\\.mm\\'" . objc-mode))

  (setq-default c-basic-offset 4)

  (setq projectile-globally-ignored-file-suffixes '("*.xcuserstate" ".png" ".gif" ".pdf"))

  )

(defun xy/config-org()

  (load-library "find-lisp")
  (setq org-agenda-files (find-lisp-find-files "~/Dropbox/org" "\.org$"))

  (setq org-default-notes-file "~/Dropbox/org/index.org")
  (setq org-agenda-files '("~/Dropbox/org/index.org"))

  ;; disable evil mode in calendar-mode
  (require 'evil)
  (evil-set-initial-state 'calendar-mode 'emacs)

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
  )
