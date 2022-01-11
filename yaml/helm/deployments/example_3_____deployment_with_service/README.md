###################################################################
# Это мой первый чарт который разворачивает deployment,
# c двумя репликами пода, в которых разворачиваются два контейнера,
# которые логически между собой не связаны.
###################################################################

# Развернуть релиз
helm install example-3 ./


# Посмотреть статус релиза
helm status example-3


# Посмотреть список деплойментов
kubectl get deployments.apps


# Посмотреть список подов нашего деплоймента (ищет по label)
kubectl get pods -l appname=example-3-pod



# Посмотреть подробную информацию по поду
kubectl describe deployments.apps example-3-deployment



# Удалить релиз
helm uninstall example-3


#--- Для быстрой проверки работоспобоности в одну команду ---#

echo; helm install example-3 ./ ; sleep 3 ; echo; \
helm status example-3 ; sleep 3 ; echo; \
echo "Список развернутых деплойментов:"; echo; \
kubectl get deployments.apps ; sleep 3 ; echo; \
echo "Рассмотрим наш деплоймент по подробнее:"; echo; sleep 3; \
kubectl describe deployments.apps example-3-deployment ; sleep 10 ; echo; \
echo "В нашем деплойменте крутятся вот эти поды:"; echo; \
kubectl get pods -o wide -l appname=example-3-pod ; sleep 3 ; echo; \
echo "В каждом из этих подов данного деплоймента крутятся следующие контейнеры:"; sleep 3; echo; \
echo "Containers Name: $(kubectl get deployments.apps -l env=test -o jsonpath='{.items[*].spec.template.spec.containers[*].name}')"; echo; sleep 3; \
echo "Удаляем наш Helm релиз:"; echo; \
helm uninstall example-3; echo

#------------------------------------------------------------#
