(def accounts [(ref 0) (ref 0) (ref 0) (ref 0)])

(defn debit [accountNum amount] (dosync (alter (accounts accountNum) #(- % amount))))
(defn credit [accountNum amount] (dosync (alter (accounts accountNum) + amount)))

(debit 1 5)
(credit 1 7)
(credit 2 10)
(debit 3 3)

(println @(accounts 0) @(accounts 1) @(accounts 2) @(accounts 3))
