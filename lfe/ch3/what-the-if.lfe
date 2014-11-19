(defmodule what-the-if
  (export (heh-fine 0)))

(defun heh-fine ()
  (if (=:= 1 1)
    'work)
  (if (or (=:= 1 2) (=:= 1 1))
    'work)
  (if (and (=:= 1 2) (=:= 1 1))
    'fail))
