;; private/amin/autoload/default.el -*- lexical-binding: t; -*-

;;;###autoload
(defun +default/yank-buffer-filename ()
  "Copy the current buffer's path to the kill ring."
  (interactive)
  (if-let* ((filename (or buffer-file-name (bound-and-true-p list-buffers-directory))))
      (message (kill-new (abbreviate-file-name filename)))
    (error "Couldn't find filename in current buffer")))

;;;###autoload
(defmacro +default--def-browse-in! (name dir &optional prefix)
  (let ((prefix (cdr (doom-module-from-path load-file-name))))
    `(defun ,(intern (format "%s/browse-%s" (or prefix '+default) name)) ()
       (interactive)
       (doom-project-browse ,dir))))

;;;###autoload
(defmacro +default--def-find-in! (name dir)
  (let ((prefix (cdr (doom-module-from-path load-file-name))))
    `(defun ,(intern (format "+%s/find-in-%s" prefix name)) ()
       (interactive)
       (doom-project-find-file ,dir))))


;;;###autoload (autoload '+default/browse-project "private/amin/autoload/default" nil t)
(+default--def-browse-in! project (doom-project-root))

;;;###autoload (autoload '+default/find-in-templates "private/amin/autoload/default" nil t)
(+default--def-find-in!   templates +file-templates-dir)
;;;###autoload (autoload '+default/browse-templates "private/amin/autoload/default" nil t)
(+default--def-browse-in! templates +file-templates-dir)

;;;###autoload (autoload '+default/find-in-emacsd "private/amin/autoload/default" nil t)
(+default--def-find-in!   emacsd doom-emacs-dir)
;;;###autoload (autoload '+default/browse-emacsd "private/amin/autoload/default" nil t)
(+default--def-browse-in! emacsd doom-emacs-dir)

;;;###autoload (autoload '+default/find-in-notes "private/amin/autoload/default" nil t)
(+default--def-find-in!   notes +org-dir)
;;;###autoload (autoload '+default/browse-notes "private/amin/autoload/default" nil t)
(+default--def-browse-in! notes +org-dir)

;;;###autoload (autoload '+default/find-in-snippets "private/amin/autoload/default" nil t)
(+default--def-find-in! snippets +amin-snippets-dir)
;; NOTE No need for a browse-snippets variant, use `yas-visit-snippet-file'

