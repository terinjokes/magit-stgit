;;; magit-stgit-test.el --- Tests for magit-stgit
;;
;; Copyright ¢ 2020 Terin Stock <terinjokes@gmail.com>
;;
;; Package-Requires: (mocker "20150917.154")
;;
;;; Commentary:
;;
;; This file contains tests for magit-stgit.el
;;
;;; Code:

(require 'mocker)
(load-file "magit-stgit.el")

(ert-deftest magit-stgit-lines ()
  (mocker-let ((process-file (program &optional infile buffer display &rest args)
                             ((:input '("stg" nil (t nil) nil "series" "--noprefix")
                               :output-generator (lambda (program &optional infile buffer display &rest args)
                                                   (insert "test1\ntest2\n\ntest3\n"))))))
              (should (equal (magit-stgit-lines "series" "--noprefix")
                             '("test1" "test2" "test3")))))

;;; magit-stgit-test.el ends here
