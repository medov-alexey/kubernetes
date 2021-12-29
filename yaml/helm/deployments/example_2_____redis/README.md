#################################################################
# Это мой второй Helm чарт в данном обучении.

# Данный чарт разворачивает deployment, который разворачивает
# один под, с одним докер контейнером, где крутится Redis сервер.
#
# Также тут в описании команд показываю пример обновления релиза
#################################################################


# Развернуть релиз
helm install my-simple-redis ./



# Посмотреть статус релиза
helm status my-simple-redis



# Посмотреть список подов
kubectl get pods -o wide



# Посмотреть подробную информацию по поду
kubectl describe pod my-simple-redis



# Обновляем релиз. 
# Тут мы через ключ "-f" указываем путь к файлу с новыми переменными которые хотим применить в релизе.
helm upgrade my-simple-redis ./ -f ./new-values-file.yaml



# Удалить релиз
helm uninstall my-simple-redis



#--- Для быстрой проверки работоспобоности в одну команду ---#

echo; helm install my-simple-redis ./ ; sleep 3 ; echo; \
helm status my-simple-redis ; sleep 3 ; echo; sleep 3; \
echo "----- До обновления Helm релиза: -----"; echo; sleep 3; \
kubectl get pods -o wide ; sleep 3 ; echo; \
echo "Container Name: $(kubectl get pods my-simple-redis -o jsonpath='{.spec.containers[*].name}')"; echo; \
kubectl describe pod my-simple-redis | grep Image; sleep 3 ; echo ; \
helm upgrade my-simple-redis ./ -f ./new-values-file.yaml ; sleep 3 ; echo; echo; echo; \
echo "----- После обновления Helm релиза: -----"; echo; sleep 3; \
kubectl get pods -o wide ; sleep 3 ; echo; \
echo "Container Name: $(kubectl get pods my-simple-redis-trololo -o jsonpath='{.spec.containers[*].name}')"; echo; \
kubectl describe pod my-simple-redis-trololo | grep Image; sleep 3 ; echo ""; \
echo "Обрати внимание: Я изменил имя пода, имя контейнера, образ и версию образа"; echo; sleep 3; \
helm uninstall my-simple-redis; echo

#------------------------------------------------------------#
