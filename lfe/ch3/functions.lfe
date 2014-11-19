(defmodule functions
  (export (head 1) (seconds 1) (same 2) (valid-time 1) (old-enough 1)))

(defun head
  [((cons h _)) h])
  
  
(defun seconds
  [((cons _ (cons x _))) x])
                             

(defun same
  [(y x) (when (=:= y x)) 'true]
  [(_ _) 'false])

(defun valid-time
  [((tuple (tuple y m d)
           (tuple h min s)))
   (: io format "The Date tuple (~p) says today is: ~p/~p/~p,~n" (list (tuple y m d) y m d))
   (: io format "The time tuple (~p) indicates : ~p:~p:~p.~n" (list (tuple h min s) h min s))]
  [(_) (: io format "Stop feeding me wrong data!~n")])

(defun old-enough
  [(x) (when (>= x 16)) 'true]
  [(_) 'false])

