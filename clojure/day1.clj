(defn big [st n] (> (count st) n))

(defn printSize [st n] (println (str (str st " is " (if (big st n) "big." "not big.")))))
(printSize "Elephant" 6)
(printSize "Mouse" 6)

(defn collection-type [coll]
  (if (list? coll)
    :list
    (if (map? coll)
      :map
      (if (vector? coll)
        :vector))))

(defn printCollectionType [coll] (println (str coll " is a " (collection-type coll))))
(printCollectionType '(1 2 3 4))
(printCollectionType '[1 2 3 4])
(printCollectionType '{1 2, 3 4})
