(defmacro unless [test unless-body else-body]
  (list 'if (list 'not test) unless-body else-body))

(unless true (println "unless true") (println "unless true else"))
(unless false (println "unless false") (println "unless false else"))

(defprotocol Notifier
  (notify [this msg]))

(defrecord EmailNotifier [email-address]
  Notifier
  (notify [this msg] (println (str "Sending an email to " (:email-address this) ": " msg))))

(defrecord SmsNotifier [mobile-number]
  Notifier
  (notify [this msg] (println (str "Sending a text to " (:mobile-number this) ": " msg))))

(let [e (EmailNotifier. "matt@example.com")
      s (SmsNotifier. "07000 000000")]
  (notify e "Congratulations, you're our one millionth visitor!")
  (notify s "Have you been missold PPI?"))
