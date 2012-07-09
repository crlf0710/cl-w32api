
(in-package :cl-user)

(defpackage #:cl-w32api
  (:use)
  (:import-from #:common-lisp
                #:in-package
                #:&rest)
  (:import-from #:nffi
                #:defctype-forward
                #:defctype
                #:defcvar
                #:defcfun
                #:defcstruct
                #:defcunion
                #:defcenum))


                
