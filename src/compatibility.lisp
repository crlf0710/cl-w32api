(in-package #:cl-user)

(defmacro cl-w32api::defctype-forward (&rest items)
  `(warn "DEFCTYPE-FORWARD: ~A~%" ',(car items)))

(defmacro cl-w32api::defcvarx (name-and-options type &key count)
  (if (not count)
      `(cffi:defcvar ,name-and-options ,type)
      (progn
        (warn "DEFCTYPE does not support array yet ~%")
        `(cffi:defcvar ,name-and-options (:array ,type ,count)))))

(defmacro cl-w32api::defctypex (name base-type &key count)
  (if (not count)
      `(cffi::defctype* ,name ,base-type)
      (progn
        (warn "DEFCTYPE does not support array yet ~%")
        `(cffi::defctype* ,name (:array ,base-type ,count)))))


(cffi:define-parse-method :enum (name)
  (funcall (cffi::find-type-parser name)))

(cffi:defctype :int24 (:array :int8 3))
(cffi:defctype :unsigned :uint)

#-scl
#+x86
(cffi:defctype :long-double :double)
#+x86_64
(cffi:defctype :long-double (:array :double 2))
#-(or x86 x86_64)
(error "Unsupported platform yet")

;; patch cffi 
(setf (symbol-function 'cffi::structure-by-value-p)
      (lambda (ctype)
        (typep (cffi::follow-typedefs (cffi::parse-type ctype))
               '(or cffi::foreign-struct-type cffi::foreign-union-type))))

(defmethod cffi::bare-struct-type-p ((x t))
  nil)
