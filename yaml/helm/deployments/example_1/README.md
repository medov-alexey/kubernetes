###################################################################
# Это мой первый чарт который разворачивает deployment,
# c двумя репликами пода, в которых разворачиваются два контейнера,
# которые логически между собой не связаны.
###################################################################

# Развернуть релиз
helm install example-1 ./


# Посмотреть статус релиза
helm status example-1



# Посмотреть список подов
kubectl get pods -o wide | grep example-1



# Посмотреть подробную информацию по поду
kubectl describe deployments.apps example-1-deployment



# Удалить релиз
helm uninstall example-1


#--- Для быстрой проверки работоспобоности в одну команду ---#

helm install example-1 ./ ; sleep 3 ; \
helm status example-1 ; sleep 3  ; \
kubectl get pods -o wide | grep example-1 ; sleep 3  ; \
kubectl describe deployments.apps example-1-deployment ; sleep 3  ; \
helm uninstall example-1

#------------------------------------------------------------#
