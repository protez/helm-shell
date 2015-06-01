;;; helm-shell.el --- helm multi-shell management. -*- lexical-binding: t -*-

;; Copyright (C) 2015 Sancheol Park <park.sangcheol@gmail.com>

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;; Author: Sangcheol Park <park.sangcheol@gmail.com>
;; URL: https://github.com/protez/helm-shell
;; Version: 1.0
;; Package-Requires: ((emacs "24") (helm "0.0") (cl-lib "0.5"))
;; Keywords: helm shell

;;; Commentary:

;; Create, switch inferior shell modes easily with Helm

;; A call to `helm-shell` will show a list of running terminal sessions
;; by examining buffers with major mode `term-mode`.  From there, you
;; should be able to create, or switch over to existing
;; terminal buffers


;;; Code:
(require 'cl-lib)
(require 'helm)

(defvar helm-marked-buffer-name)

(defun helm-shell/shell-buffers ()
  "Filter for buffers that are shells only."
  (cl-loop for buf in (buffer-list)
           if (eq 'shell-mode (buffer-local-value 'major-mode buf))
           collect (buffer-name buf)) )

(defun helm-shell/launch-shell (name)
  "Create new shell in a buffer called NAME."
  (let ((current-prefix-arg '(4)))
    (shell))
  (rename-buffer (format "*shell<%s>*" name)))

(defvar helm-shell/shell-source-shells
      '((name . "Shell buffers")
        (candidates . (lambda () (or
                                  (helm-shell/shell-buffers)
                                  (list ""))))
        (action . (("Switch to shell buffer" . (lambda (candidate)
                                                 (switch-to-buffer candidate)))
                   ))))

(defvar helm-shell/shell-source-shell-not-found
  '((name . "Launch a new shell")
    (dummy)
    (action . (("Launch new shell" . (lambda (candidate)
                                          (helm-shell/launch-shell candidate)))))))

;;;###autoload
(defun helm-shell ()
  "Custom helm buffer for shells only."
  (interactive)
  (let ((sources
        '(helm-shell/shell-source-shells
          helm-shell/shell-source-shell-not-found)))
    (helm :sources sources
          :buffer "*helm-shell*")))

(provide 'helm-shell)

;;; helm-shell.el ends here
