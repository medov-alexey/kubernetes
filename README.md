Как установить утилиту Kubectl

1) cd /tmp
2) curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
3) chmod +x ./kubectl
4) sudo cp -rf ./kubectl /usr/local/bin/kubectl
5) sudo cp -rf ./kubectl /usr/bin/kubectl

---

Как установить minikube и компоненты для его работы (проверял на Ubuntu 24.04):

Команды нужно запускать из под обычного пользователя (не root)

1) cd /tmp
2) sudo apt update
3) sudo apt install cpu-checker qemu-kvm libvirt-daemon-system libvirt-clients bridge-utils virtinst virt-manager -y
4) sudo systemctl enable --now libvirtd
5) sudo usermod -aG libvirt $USER
5) sudo usermod -aG kvm $USER
5) curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64 && chmod +x minikube
6) sudo install minikube /usr/local/bin/
7) minikube version
8) echo 'source <(minikube completion bash)' >> ~/.bashrc
9) minikube config set driver kvm2
10) sudo shutdown -r now

Запуск Kubernetes кластера Minikube выполняется одной командой: minikube start 

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
