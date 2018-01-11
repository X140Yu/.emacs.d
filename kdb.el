(defun xy/swift-playground ()
  (interactive)
  (find-file "/tmp/a.swift")
  )

(defun xy/spacemacs()
  (interactive)
  (find-file "~/.spacemacs")
  )
(defun xy/todo()
  (interactive)
  (find-file "~/Dropbox/org/index.org")
  )
(defun xy/inbox ()
  (interactive)
  (find-file "~/Dropbox/org/inbox.org")
  )

(defun xah-copy-file-path (&optional @dir-path-only-p)
  "Copy the current buffer's file path or dired path to `kill-ring'.
Result is full path.
If `universal-argument' is called first, copy only the dir path.

If in dired, copy the file/dir cursor is on, or marked files.

If a buffer is not file and not dired, copy value of `default-directory' (which is usually the “current” dir when that buffer was created)

URL `http://ergoemacs.org/emacs/emacs_copy_file_path.html'
Version 2017-09-01"
  (interactive "P")
  (let (($fpath
         (if (string-equal major-mode 'dired-mode)
             (progn
               (let (($result (mapconcat 'identity (dired-get-marked-files) "\n")))
                 (if (equal (length $result) 0)
                     (progn default-directory )
                   (progn $result))))
           (if (buffer-file-name)
               (buffer-file-name)
             (expand-file-name default-directory)))))
    (kill-new
     (if @dir-path-only-p
         (progn
           (message "Directory path copied: 「%s」" (file-name-directory $fpath))
           (file-name-directory $fpath))
       (progn
         (message "File path copied: 「%s」" $fpath)
         $fpath )))))

(defun xy/get-file-dir-or-home ()
  (interactive)
  (xah-copy-file-path "P"))

(defun xy/iterm-goto-filedir-or-home ()
  "Go to present working dir and focus iterm"
  (interactive)
  (do-applescript
   (concat
    " tell application \"iTerm2\"\n"
    "     tell current window\n"
    "         create tab with default profile\n"
    "     end tell\n"
    "   tell the current session of current window\n"
    (format "     write text \"cd %s\" \n" (xy/get-file-dir-or-home))
    "   end tell\n"
    " end tell\n"
    " do shell script \"open -a iTerm\"\n"
    )))

(defun xy/load-kbd ()

  (global-set-key (kbd "s-O") 'projectile-find-file)
  (global-set-key (kbd "<s-down>") 'ff-find-other-file)
  (global-set-key (kbd "s-/") 'comment-or-uncomment-lines)
  (global-set-key (kbd "s-/") 'comment-or-uncomment-region)

  (global-set-key (kbd "C-c C-j") 'org-journal-new-entry)

  (global-set-key (kbd "C-c C-c") nil)
  (global-set-key (kbd "C-c C-c c") 'org-capture)
  (global-set-key (kbd "C-c C-c p") 'xy/swift-playground)
  (global-set-key (kbd "C-c C-c s") 'xy/spacemacs)
  (global-set-key (kbd "C-c C-c o") 'xy/todo)
  (global-set-key (kbd "C-c C-c i") 'xy/inbox)
  (global-set-key (kbd "C-`") 'xy/iterm-goto-filedir-or-home)
  )
