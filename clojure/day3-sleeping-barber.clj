; Value represents whether barber is awake.
(def barber (ref false))
(defn wakeBarber [] (ref-set barber true))
(defn fallAsleep [] (ref-set barber false))

; Value represents customer number in chair.
(def barberChair (ref nil))
; TODO: consider refactor: use chairs vector rather than explicit ref for each chair.
(def chair1 (ref nil))
(def chair2 (ref nil))
(def chair3 (ref nil))
(defn numOccupiedChairs [] (count (filter identity [@chair1 @chair2 @chair3])))

(def customers (ref []))
(defn leaveImmediately [n] (alter customers #(assoc % n :uncut)))
(defn sitInBarberChair [n] (alter customers #(assoc % n :cutting)) (ref-set barberChair n))
(defn haveHairCut [n] (alter customers #(assoc % n :cut)))
(defn sitInWaitingRoom [n numEarlierWaitingCustomers] (alter customers #(assoc % n numEarlierWaitingCustomers)))
(defn moveUpInQueue [n] (alter customers #(assoc % n (dec (get @customers n)))))

; Barber behaviour: if there are no waiting customers, fall asleep; otherwise invite next customer to barber chair.
; Customer behaviour:
; - If next customer is called and there are no customers ahead of them, sit in barber seat and wake barber.
; - If next customer is called and there are customers ahead of them, decrement number of customers ahead of them.
(defn callNextCustomer []
  (if (and (not @chair1) (not @chair2) (not @chair3))
    (fallAsleep)
    (do
      (if @chair1
        (if (= (get @customers @chair1) 0)
          (do (sitInBarberChair @chair1) (ref-set chair1 nil) (wakeBarber))
          (moveUpInQueue @chair1))
        nil)
      (if @chair2
        (if (= (get @customers @chair2) 0)
          (do (sitInBarberChair @chair2) (ref-set chair2 nil) (wakeBarber))
          (moveUpInQueue @chair2))
        nil)
      (if @chair3
        (if (= (get @customers @chair3) 0)
          (do (sitInBarberChair @chair3) (ref-set chair3 nil) (wakeBarber))
          (moveUpInQueue @chair3))
        nil))))

(defn cutHair []
  ; NOTE: important not to sleep within the transaction otherwise conflicts (which there will likely be because of the
  ; long time) will cause the transaction to fail and retry, conflicting again!
  (Thread/sleep 20)
  (dosync (let [n @barberChair] (haveHairCut n) (ref-set barberChair nil) (callNextCustomer))))

; Customer behaviour:
; - If barber's seat is empty on arrival, sit in it and wake barber.
; - If barber's seat is occupied on arrival but there is empty chair in the waiting room, sit in it, noting number of customers ahead.
; - If there are no available seats on arrival, leave.
(defn enterBarberShop [n]
  ; We're doing all this within a transaction. Presumably, by analogy to database transactions, this means that if the
  ; values read from the refs change before the transaction is committed, the transaction is aborted and retried.
  (dosync
   (if (not @barberChair)
     (do (sitInBarberChair n) (wakeBarber))
     (if (not @chair1)
       (do (sitInWaitingRoom n (numOccupiedChairs)) (ref-set chair1 n))
       (if (not @chair2)
         (do (sitInWaitingRoom n (numOccupiedChairs)) (ref-set chair2 n))
         (if (not @chair3)
           (do (sitInWaitingRoom n (numOccupiedChairs)) (ref-set chair3 n))
           (leaveImmediately n)))))))

(defn timeIntervalLessThanTenSeconds [startTimeNanos endTimeNanos]
  (< (/ (- endTimeNanos startTimeNanos) 1000000000.0) 10))

(def startTime (System/nanoTime))

(def barberFuture
  (future
    (loop [counter 0]
      (when (timeIntervalLessThanTenSeconds startTime (System/nanoTime))
        (println "Barber loop" counter)
        (if @barber
          (cutHair)
          ; Avoid looping hundreds of thousands of times!
          (Thread/sleep 1))
        (recur (inc counter))))))

(def customersFuture
  (future
    (loop [counter 0]
      (Thread/sleep (+ 10 (rand-int 21)))
      (println "Customer" counter "entering shop.")
      (future (enterBarberShop counter))
      (when (timeIntervalLessThanTenSeconds startTime (System/nanoTime))
        (recur (inc counter))))))

@barberFuture
@customersFuture

(println
 (count (filter #(= :cut %) @customers)) "customers had their hair cut,"
 (count (filter #(= :uncut %) @customers)) "left without having their hair cut,"
 ; Because callNextCustomer runs at the end of cutHair, there'll be a customer in barberChair (:cutting).
 (count (filter #(or (= :cutting %) (integer? %)) @customers)) "were waiting when the shop closed.")
