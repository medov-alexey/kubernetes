###################################################################
# Этот чарт разворачивает одиночный инстанс Consul в Kubernetes
###################################################################

# Развернуть релиз
helm install consul ./


# Посмотреть статус релиза
helm status consul


# Посмотреть список деплойментов
kubectl get deployments.apps


# Посмотреть список подов нашего деплоймента (ищет по label)
kubectl get pods -l appname=consul



# Посмотреть подробную информацию по поду
kubectl describe deployments.apps consul



# Удалить релиз
helm uninstall consul


# Для быстрой проверки работоспобоности в одну команду

echo; helm install consul ./ ; sleep 3 ; echo; \
helm status consul ; sleep 3 ; echo; \
echo "Список развернутых деплойментов:"; echo; \
kubectl get deployments.apps ; sleep 3 ; echo; \
echo "Рассмотрим наш деплоймент по подробнее:"; echo; sleep 3; \
kubectl describe deployments.apps consul ; sleep 10 ; echo; \
echo "В нашем деплойменте крутятся вот эти поды:"; echo; \
kubectl get pods -o wide -l appname=consul ; sleep 3 ; echo; \
echo "В каждом из этих подов данного деплоймента крутятся следующие контейнеры:"; sleep 3; echo; \
echo "Containers Name: $(kubectl get deployments.apps -l env=test -o jsonpath='{.items[*].spec.template.spec.containers[*].name}')"; echo; sleep 3; \
echo "Удаляем наш Helm релиз:"; echo; \
helm uninstall consul; echo
