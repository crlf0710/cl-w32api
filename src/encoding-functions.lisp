
(in-package #:cl-w32api)

(define-wrapper-macro message-box
    #+cl-w32api-use-unicode message-box-w
    #-cl-w32api-use-unicode message-box-a (hwnd lptext lpcaption utype))

(define-wrapper-macro register-class
    #+cl-w32api-use-unicode register-class-w
    #-cl-w32api-use-unicode register-class-a (lpwndclass))

(define-wrapper-macro load-cursor
    #+cl-w32api-use-unicode load-cursor-w
    #-cl-w32api-use-unicode load-cursor-a (hinstance lpcursorname))

(define-wrapper-macro get-module-handle
    #+cl-w32api-use-unicode get-module-handle-w
    #-cl-w32api-use-unicode get-module-handle-a (lpmodulename))

(define-wrapper-macro text-out
    #+cl-w32api-use-unicode text-out-w
    #-cl-w32api-use-unicode text-out-a (hdc x y lpstring c))

(define-wrapper-macro def-window-proc
    #+cl-w32api-use-unicode def-window-proc-w
    #-cl-w32api-use-unicode def-window-proc-a (hwnd msg wparam lparam))

(define-wrapper-macro get-message
    #+cl-w32api-use-unicode get-message-w
    #-cl-w32api-use-unicode get-message-a (lpmsg hwnd wmsgfiltermin wmsgfiltermax))

(define-wrapper-macro dispatch-message
    #+cl-w32api-use-unicode dispatch-message-w
    #-cl-w32api-use-unicode dispatch-message-a (lpmsg))

(define-wrapper-macro unregister-class
    #+cl-w32api-use-unicode unregister-class-w
    #-cl-w32api-use-unicode unregister-class-a (lpclassname hinstance))

(define-wrapper-macro create-window-ex
    #+cl-w32api-use-unicode create-window-ex-w
    #-cl-w32api-use-unicode create-window-ex-a
    (dwexstyle lpclassname lpwindowname dwstyle x y nwidth nheight
               hwndparent hmenu hinstance lpparam))

(cl:defmacro create-window (&whole form lpclassname lpwindowname dwstyle x y
                              nwidth nheight hwndparent hmenu hinstance lpparam)
  `(create-window-ex 0 ,@(cl:rest form)))

(define-wrapper-macro set-window-text
    #+cl-w32api-use-unicode set-window-text-w
    #-cl-w32api-use-unicode set-window-text-a (hwnd lpstring))

(define-wrapper-macro ext-text-out
    #+cl-w32api-use-unicode ext-text-out-w
    #-cl-w32api-use-unicode ext-text-out-a (hdc x y options lprect lpstring c lpdx))

    
