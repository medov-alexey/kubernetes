#################################################################
# Это мой второй Helm чарт в данном обучении.

# Данный чарт разворачивает deployment, который разворачивает
# один под, с одним докер контейнером, где крутится Redis сервер.
#
# Также тут в описании команд показываю пример обновления релиза
#################################################################


# Развернуть релиз
helm install redis-for-application-1 ./



# Посмотреть статус релиза
helm status redis-for-application-1



# Посмотреть список подов
kubectl get pods -o wide



# Посмотреть подробную информацию по поду
kubectl describe pod redis-for-application-1



# Обновляем релиз. 
# Тут мы через ключ "-f" указываем путь к файлу с новыми переменными которые хотим применить в релизе.
helm upgrade redis-for-application-1 ./ -f ./new-values-file.yaml



# Удалить релиз
helm uninstall redis-for-application-1



#--- Для быстрой проверки работоспобоности в одну команду ---#

echo; helm install redis-for-application-1 ./ ; sleep 3 ; echo; \
helm status redis-for-application-1 ; sleep 3 ; echo; sleep 3; \
echo "Список развернутых деплойментов:"; echo; \
kubectl get deployments.apps ; sleep 3 ; echo; \
echo "Рассмотрим наш деплоймент по подробнее:"; echo; sleep 3; \
kubectl describe deployments.apps redis-for-application-1 ; sleep 10 ; echo; \
echo "----- Поды до обновления Helm релиза: -----"; echo; sleep 3; \
kubectl get pods -o wide ; sleep 3 ; echo; \
kubectl describe pod -l appname=redis-for-application-1 | grep Image; sleep 3 ; echo ; \
helm upgrade redis-for-application-1 ./ -f ./new-values-file.yaml ; sleep 10 ; echo; echo; echo; \
echo "----- Поды после обновления Helm релиза: -----"; echo; sleep 3; \
kubectl get pods -o wide ; sleep 3 ; echo; \
echo "Containers Name: $(kubectl get deployments.apps -l env=test,apptype=cache -o jsonpath='{.items[*].spec.template.spec.containers[*].name}')"; sleep 3; \
kubectl describe pod -l appname=redis-for-application-1 | grep Image; sleep 3 ; echo ""; \
echo "Обратите внимание: Я изменил версию образа контейнера использующийся в подах"; echo; sleep 3; \
helm uninstall redis-for-application-1; echo

#------------------------------------------------------------#
