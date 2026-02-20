Как установить утилиту Kubectl

1) curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
2) chmod +x ./kubectl
3) sudo cp -rf ./kubectl /usr/local/bin/kubectl
4) sudo cp -rf ./kubectl /usr/bin/kubectl

---

Как проверить версию утилиты Kubectl

kubectl version --client

---

Как посмотреть информацию о кластере

kubectl cluster-info

---

Как посмотреть информацию о всех серверах в кластере

kubectl get nodes

---

Как посмотреть список всех подов

kubectl get pods

---

Как запустить самый простой под с именем "testpod" с Nginx контейнером на борту

kubectl run testpod --generator=run-pod/v1 --image=nginx:alpine --port=80

---

Как удалить под с именем "testpod"

kubectl delete pods testpod

---

Как посмотреть описание пода "testpod"

kubectl describe pods testpod

---

Как запустить команду внутри контейнера запущенного в поде "testpod"

kubectl exec testpod date

---

Как зайти в терминал внутри контейнера запущенного в поде "testpod"

В старой версии Kubernetes: kubectl exec -it testpod sh

В новой версии Kubernetes: kubectl exec test -it -- bash

В новой версии Kubernetes внутрь конкретного контейнера: kubectl exec test -с container123 -it -- bash

---

Как посмотреть логи пода "testpod"

kubectl logs testpod

---

Как пробросить локальный порт 9999 до 80 порта внутри контейнера пода "testpod"

kubectl port-forward testpod 9999:80

--

Как запустить простой под из манифест файла

kubectl apply -f 1_____first_manifest.yaml

---
