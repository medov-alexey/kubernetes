1)

В данном примере выполняя команду "kubectl apply -f configmap.yaml"

Мы создаем объект типа ConfigMap с названием "nginx-config" в который запишется ключ "nginx.conf" с настройками для nginx


2)

Далее выполняя команду "kubectl apply -f deployment.yaml"

Мы создаем deployment, который создает под с контейнером с Nginx.

Внутрь контейнера монтируется значение ключа nginx.conf из конфигмапа nginx-config в файл /etc/nginx/nginx.conf 



То есть путь такой:

ConfigMap "nginx-config", значение ключа "nginx.conf" -------> файл /etc/nginx/nginx.conf
