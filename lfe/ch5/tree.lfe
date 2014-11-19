(defmodule tree
  (export (empty 0)
          (insert 3)
          (lookup 2)))


(defun node (data)
  (tuple 'node data))

(defun empty ()
  (node 'nil))

(defun insert
  [(key value (tuple 'node 'nil))
   (node (tuple key value (empty) (empty)))]
  [(new-key new-value (tuple 'node (tuple key value smaller larger)))
   (if (< new-key key)
     (node (tuple key value (insert new-key new-value smaller) larger))
     (if (> new-key key)
       (node (tuple key value smaller (insert new-key new-value larger)))
       (node (tuple key new-value smaller larger))))])

(defun lookup (key tree)
  (case tree
    [(tuple 'node 'nil) 'undefined]
    [(tuple 'node (tuple tree-key value larger smaller))
     (if (== tree-key key)
       (tuple 'ok value)
       (if (< tree-key key)
         (lookup key smaller)
         (lookup key larger)))]))

