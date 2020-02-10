provider "google" {
project = "${var.project}"
region = "${var.region}"
}

module "ssh_key_pair" {
  source                = "git::https://github.com/cloudposse/terraform-tls-ssh-key-pair.git?ref=master"
  namespace             = "imhio"
  name                  = "instance-key"
  ssh_public_key_path   = "../secret"
  private_key_extension = ".pem"
  public_key_extension  = ".pub"
  chmod_command         = "chmod 600 %v"
}
module "vpc" {
  source  = "./modules/vpc"
  project = "${var.project}"
  subnet_ip_priv = "${var.subnet_ip_priv}"
  network_name = "${var.network_name}"
  subnet_ip_pub = "${var.subnet_ip_pub}"
  region = "${var.region}"
}

module "instance1" {
  source  = "./modules/instance1"
  project = "${var.project}"
  instance-type = "${var.instance-type}"
  region = "${var.region}"
  subnetpriv  = "${module.vpc.private_subnet_name}"
  subnetpub  = "${module.vpc.public_subnet_name}"
  ssh_key = "${module.ssh_key_pair.public_key}"
  ssh_user = "${var.ssh_user}"
}

module "instance2" {
  source  = "./modules/instance2"
  project = "${var.project}"
  instance-type = "${var.instance-type}"
  region = "${var.region}"
  subnetpriv  = "${module.vpc.private_subnet_name}"
  subnetpub  = "${module.vpc.public_subnet_name}"
  ssh_key = "${module.ssh_key_pair.public_key}"
  ssh_user = "${var.ssh_user}"
  disk_size = "${var.disk_size}"
}

module "firewall" {
  source  = "./modules/firewall"
  project = "${var.project}"
  subnetpriv  = "${module.vpc.private_network_name}"
  subnetpub  = "${module.vpc.public_network_name}"
  allowedip = "${var.allowedip}"
}


resource "local_file" "ansible_inventory" {
  content = "[application]\n${module.instance1.instance_name} ansible_host=${module.instance1.external_ip} ansible_ssh_private_key_file=../secret/${module.ssh_key_pair.key_name}.pem internalip=${module.instance1.internal_ip} ansible_user=${var.ssh_user}\n\n[database]\n${module.instance2.instance_name} ansible_host=${module.instance2.external_ip} ansible_ssh_private_key_file=../secret/${module.ssh_key_pair.key_name}.pem internalip=${module.instance2.internal_ip} ansible_user=${var.ssh_user}"
  filename = "../ansible/inventory"
}