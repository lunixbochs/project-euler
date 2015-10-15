(print (apply '+
  (loop for n from 1 below 1000 by 1
        if (or (eq (mod n 5) 0) (eq (mod n 3) 0))
           collect n)))
