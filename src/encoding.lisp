
(in-package #:cl-w32api)

(cl:eval-when (:compile-toplevel :load-toplevel :execute)
  (cl:pushnew :cl-w32api-use-unicode cl:*features*))

(cl:defvar *lcid-babel-encoding-map* '((2052 . :gbk)
                                       (nil  . :ascii)))

(cl:defvar *default-unicode-character-encoding* #+little-endian :ucs-2le
                                                #+big-endian    :ucs-2be
                                                #-(or little-endian big-endian)
                                                                :ucs-2)
(cl:defvar *default-ansi-character-encoding*
      (cl:or (cl:cdr (cl:assoc (get-system-default-lcid)*lcid-babel-encoding-map*))
             (cl:cdr (cl:assoc nil                      *lcid-babel-encoding-map*))))

(setf *default-character-encoding*
      #+cl-w32api-use-unicode
      *default-unicode-character-encoding*
      #-cl-w32api-use-unicode
      *default-ansi-character-encoding*)

(cl:defmacro define-wrapper-macro (name oldname args)
  (cl:let ((whole-sym (cl:gensym)))
    `(cl:defmacro ,name (cl:&whole ,whole-sym ,@args)
       (cl:list* ',oldname (cl:rest ,whole-sym)))))

(cl:defun allocate-foreign-astring
    (&optional string buffer-size pool)
  (allocate-foreign-string string buffer-size
                           *default-ansi-character-encoding*
                           (cl:or pool nffi::*foreign-object-pool*)))

(cl:defun allocate-foreign-wstring
    (&optional string buffer-size pool)
  (allocate-foreign-string string buffer-size
                           *default-unicode-character-encoding*
                           (cl:or pool nffi::*foreign-object-pool*)))


