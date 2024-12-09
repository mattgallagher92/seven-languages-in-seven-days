(defn big [st n] (> (count st) n))

(defn printSize [st n] (println (str (str st " is " (if (big st n) "big." "not big.")))))
(printSize "Elephant" 6)
(printSize "Mouse" 6)
