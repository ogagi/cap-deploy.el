;;; cap-deploy.el --- Deploy an app by the use of capistrano and bundler

;; Copyright (c) 2013 Oscar Garcia <o.garcia.gimenez@gmail.com>

;; Author: https://github.com/ogagi
;; URL: https://github.com/ogagi/cap-deploy.el
;; Date: 05-08-2013


;; TO COMPLETE WITH USAGE


;;; Code:

(require 'inf-ruby)

;;;###autoload
(defun deploy (country-name branch-name app-name stage-name)
  "Performs a deploy with the provided args.")

;;;###autoload
(defun list-servers ()
  "List the servers."
  (interactive)
  (deploy-command "COUNTRY=es bundle exec cap web playground servers:list"))
  
(defun set-country ()
  "Ask for the country to deploy if empty default ES."
)

(defun set-branch ()
  "Ask for the branch to deploy if empty default release."
)

(defun set-app ()
  "Ask for the app to deploy can't be empty."
)

(defun set-stage ()
  "Ask for the stage to deploy can't be empty."
)

(defun deploy-command (cmd)
  "Run cmd in an async buffer."
  (async-shell-command cmd "*Deployer*"))

(defun* deploy-locate-capfile (&optional (dir default-directory))
  (let ((has-capfile (directory-files dir nil "^Capfile$"))
	(is-root (equal dir "/")))
    (cond
     (has-capfile dir)
     (is-root
      (print (format
	      "No capfile found for the current directory!"
	      default-directory))
      nil)
     ((deploy-locate-capfile (expand-file-name ".." dir))))))

(provide 'cap-deploy)
;;; cap-deploy.el ends here
	
