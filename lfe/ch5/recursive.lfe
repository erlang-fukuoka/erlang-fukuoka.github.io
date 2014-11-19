(defmodule recursive
  (export (fac 1) (len 1) (tail-fac 1) (tail-len 1) (deplicate 2) (reverse 1) (tail-reverse 1)
          (sublist 2) (tail-sublist 2) (quicksort 1)))

(defun fac
  [(0) 1]
  [(n) (when (> n 0)) (* n (fac (- n 1)))])

(defun len
  [(()) 0]
  [((cons _ t)) (+ 1 (len t))])

(defun tail-fac (n)
  (tail-fac n 1))

(defun tail-fac
  [(0 result) result]
  [(n acc) (when (> n 0))
   (tail-fac (- n 1) (* acc n))])

(defun tail-len (l)
  (tail-len l 0))

(defun tail-len
  [(() result) result]
  [((cons _ t) acc)
   (tail-len t (+ acc 1))])

(defun deplicate (n lst)
  (deplicate n lst ()))

(defun deplicate
  [(0 lst result) result]
  [(_ () result) result]
  [(n (cons h t) result)
   (deplicate (- n 1) t (cons h result))])


(defun reverse
  [(()) ()]
  [((cons h t)) (++ (reverse t) h)])

(defun tail-reverse (lst)
  (tail-reverse lst ()))

(defun tail-reverse
  [(() result) result]
  [((cons h t) acc) (tail-reverse t (cons h acc))])

(defun sublist
  [(_ 0) ()]
  [(() n) ()]
  [((cons h t) n) (when (> n 0)) (cons h (sublist t (- n 1)))])


(defun tail-sublist (lst n)
  (tail-reverse (tail-sublist lst n ())))

(defun tail-sublist
  [(_ 0 result) result]
  [(() _ result) result]
  [((cons h t) n acc) (when (> n 0))
   (tail-sublist t (- n 1) (cons h acc))])


;;; あきた
;;; zipとかは書かないぽよーーーー!

;;; quicksortぐらいは書く

(defun quicksort (n)
  (case n
    [() ()]
    [(cons h t)
     (let (((tuple smaller larger) (partition h t)))
       (++ (quicksort smaller)
           (cons h (quicksort larger))))]))

(defun partition (pivot t)
  (case t
    [() #(() ())]
    [(cons h t2)
     (let (((tuple smaller larger) (partition pivot t2)))
       (if (=< h pivot)
         (tuple (cons h smaller) larger)
         (tuple smaller (cons h larger))))]))