(defmodule useless
  (export all))

(defun add (a b)
  (+ a b))

(defun hello ()
  (: io format "Hellom World!~n"))

(defun greet_and_add_two (x)
  (hello)
  (add x 2))