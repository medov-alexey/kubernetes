1)

В данном примере выполняя команду "kubectl create configmap nginx-config --from-file=nginx.conf"

Мы создаем объект типа ConfigMap с названием "nginx-config" в который запишется ключ "nginx.conf" с содержимым нашего файла nginx.conf


2)

Далее выполняя команду "kubectl apply -f deployment.yaml"

Мы создаем deployment, который создает под с контейнером с Nginx.

Внутрь контейнера монтируется значение ключа nginx.conf из конфигмапа nginx-config в файл /etc/nginx/nginx.conf 



То есть путь такой:

ConfigMap "nginx-config", значение ключа "nginx.conf" -------> файл /etc/nginx/nginx.conf
