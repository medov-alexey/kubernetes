1) Для запуска Kubernetes кластера с помощью Minikube просто выполните команду:

minikube start


Для запуска виртуалки c Kubernetes кластером в KVM:

minikube start --driver='kvm2'



Для запуска виртуалки с кластером в VirtualBox:

minikube start --driver='virtualbox'



Для запуска виртуалки с кластером в Docker:

minikube start --driver='docker'

#------------------------------------------------------------------------------

2) Для остановки кластера наберите команду:

minikube stop

#------------------------------------------------------------------------------

3) Для просмотра текущего статуса кластера наберите:

minikube status

#------------------------------------------------------------------------------

4) Если хочется попасть внутрь виртуальной машины где установлен кластер:

minikube ssh

#------------------------------------------------------------------------------

5) Для удаления Kubernetes кластера и виртуальной машины

minikube delete

#------------------------------------------------------------------------------





#------------------------------------------------------------------------------
