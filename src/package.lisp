
(in-package :cl-user)

(defpackage #:cl-w32api
  (:use)
  (:import-from #:common-lisp
                #:in-package
                #:&whole
                #:&optional
                #:&key
                #:&rest
                #:setf
                #:nil)
  (:import-from #:nffi
                #:defctype-forward
                #:defctype
                #:defcvar
                #:defcfun
                #:defcstruct
                #:defcunion
                #:defcenum

                #:allocate-foreign-string)

  (:export #:allocate-foreign-astring
           #:allocate-foreign-wstring))


                
