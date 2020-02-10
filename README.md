# TCG GCP Infrastructure
Этот репозиторий позволяет развернуть инфраструкуру для приложения TCG в облаке Google Cloud Platform
# GCP
Для начала создаем проект в google cloud 

```bash
gcloud init 
gcloud projects create imhio-infra --set-as-default
gcloud auth application-default login
```


# Terraform
После успешной авторизации можно изменить переменные в файле terraform/variables.tf и после этого применить изменения
```bash
cd terraform
terraform init
terraform apply
```
# Результат
2 x инстанса с доступом из публичных сетей OS Centos 7
оба инстанса также подключены к одной частной сети для 
организации безопасного обменаданными между приложением 
и БД 
ко второму инстансу подключен дополнительный внешний 
volume  для хранения данных 

# Ansible
после разворачивания инфраструктуры в GCP создасттся файл
 /ansible/inventory в котором уже будут прописаны 
 необходимые настройки, так  же в папке /secrets будут 
 находится приватный и публичный ключ для авторизации 
 на созданых машинах. останется только запустить команду 
 
```bash
cd ../ansible
ansible-playbook main.yml -i inventory
```
