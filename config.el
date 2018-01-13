
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

(defun xy/config-w3m()

  ;; 设置 w3m 主页
  (setq w3m-home-page "http://www.google.com")

  ;; 默认显示图片
  (setq w3m-default-display-inline-images t)
  (setq w3m-default-toggle-inline-images t)

  ;; 使用 cookies
  (setq w3m-use-cookies t)

  ;; 设定 w3m 运行的参数，分别为使用 cookie 和使用框架
  (setq w3m-command-arguments '("-cookie" "-F"))

  ;; 使用 w3m 作为默认浏览器
  (setq browse-url-browser-function 'w3m-browse-url)
  (setq w3m-view-this-url-new-session-in-background t)
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
  (xy/config-w3m)
  )
