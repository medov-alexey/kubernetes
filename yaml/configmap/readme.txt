# Посмотреть список текущих конфигмапов

kubectl get configmaps




# Посмотреть содержимое конкретного ConfigMap

kubectl describe configmaps my-test-configmap




# Создать ConfigMap с одной переменой "test" и ее значением "123"

kubectl create configmap my-test-configmap-1 --from-literal=test=123




# Создать ConfigMap с несколькими переменными и их значениями

kubectl create configmap my-service-config --from-literal=mama=abc --from-literal=papa=zxc




# Создать ConfigMap из существующего манифеста 

kubectl -f create configmap.yaml
