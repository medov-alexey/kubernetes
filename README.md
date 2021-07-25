Как установить утилиту Kubectl

1) curl -LO https://storage.googleapis.com/kubernetes-release/release/v1.20.2/bin/linux/amd64/kubectl
2) chmod +x ./kubectl
3) sudo cp ./kubectl /usr/local/bin/kubectl
4) sudo cp ./kubectl /usr/bin/kubectl

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

kubectl exec -it testpod sh

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
