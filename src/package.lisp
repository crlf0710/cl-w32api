
(in-package :cl-user)

(defpackage #:cl-w32api
  (:use)
  (:import-from #:common-lisp
                #:in-package
                #:+
                #:-
                #:ash)
  (:import-from #:nffi
                #:defcfun
                #:defctype
                #:defcstruct
                #:defcunion
                #:defcenum))


                
