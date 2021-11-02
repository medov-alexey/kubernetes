##########################
My simple chart with Redis
##########################


# Развернуть релиз
helm install my-simple-redis ./redis/



# Посмотреть статус релиза
helm status my-simple-redis



# Посмотреть список подов
kubectl get pods -o wide



# Посмотреть подробную информацию по поду
kubectl describe pod my-simple-redis



# Обновляем релиз. 
# Тут мы через ключ "-f" указываем путь к файлу с новыми переменными которые хотим применить в релизе.
helm upgrade my-simple-redis ./redis/ -f redis/new-values-file.yaml



# Удалить релиз
helm uninstall my-simple-redis
