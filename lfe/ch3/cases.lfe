(defmodule cases
  (export (insert 2) (beach 1)))

(defun insert
  [(x '()) `(,x)]
  [(x set)
   (case (: lists member x set)
     ('true set)
     ('false (cons x set)))])


(defun beach (temperature)
  (case temperature
    [(tuple 'celsius n) (when (>= n 20) (=< n 45))
     "favorable"]
    [(tuple 'kelvin n) (when (>= n 293) (=< n 318))
     "scientifically favorable"]
    [(tuple 'fahrenheit n) (when (>= n 68) (=< n 113))
     "favorable in the US"]
    [_  "avoid beach"]))