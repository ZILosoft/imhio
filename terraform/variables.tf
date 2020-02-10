variable "project" {
  description = "Название проекта"
  default = "imhio-infra"
}

variable "allowedip" {
  description = "Ращрешенная подсеть для ssh соеденения"
  default = "31.148.203.11/32"
}
variable "disk_size" {
  description = "Размер дополнительного volume для БД в Гб"
  default = "10"
}

variable "region" {
  description = "Зона доступности"
  default = "europe-west4"
}

variable "location" {
  description = "Локейшен датасета"
  default = "EU"
}

variable "instance-type" {
  description = "Тип инстанса"
  default = "f1-micro"
}

variable "network_name"{
  description = "Назвние сети"
  default = "imhionet"
}
variable "subnet_ip_priv"{
  description = "subnet_ip_priv"
  default = "10.10.10.0/24"
}

variable "subnet_ip_pub"{
    description = "subnet_ip_pub"
    default = "10.10.20.0/24"
  }

variable "ssh_user" {
  description = "ssh_user"
  default = "admin"
}