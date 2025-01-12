variable "cloud_id" {
  type        = string
  default     = "b1g6a0ordi02m0u7i976"
  description = ""
}

variable "folder_id" {
  type        = string
  default     = "b1g7uad4bpp6ioe1fc7h"
  description = ""
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "Default zone for resources"
}

variable "subnet_cidr" {
  type        = list(string)
  default     = ["192.168.10.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network & subnet name"
}

###yandex_compute_image vars
variable "public_image" {
  type        = string
  default     = "ubuntu-2004-lts"
  description = "image for VM"
}
###name VM vars
variable "public_name" {
  type        = string
  default     = "public"
  description = "VM1 name"
}

###public_resources var

variable "public_resources" {
  type = map(number)
  default = {
    cores         = 2
    memory        = 2
    core_fraction = 20
  }
}

### Vm nat

###yandex_compute_image vars
variable "nat_image" {
  type        = string
  default     = "nat-instance-ubuntu"
  description = "image for VM"
}
###name VM vars
variable "nat_name" {
  type        = string
  default     = "nat"
  description = "VM2 name"
}

###nat_resources var

variable "nat_resources" {
  type = map(number)
  default = {
    cores         = 2
    memory        = 2
    core_fraction = 20
  }
}

### Private

variable "default_cidr_private" {
  type    = list(string)
  default = ["192.168.20.0/24"]
}

###yandex_compute_image vars
variable "private_image" {
  type        = string
  default     = "ubuntu-2004-lts"
  description = "image for VM"
}
###name VM vars
variable "private_name" {
  type        = string
  default     = "private"
  description = "VM3 name"
}

###nat_resources var

variable "private_resources" {
  type = map(number)
  default = {
    cores         = 2
    memory        = 2
    core_fraction = 20
  }
}

variable "nat-instance-ip" {
  default = "192.168.10.254"
}

variable "lamp-image-id" {
  type    = string
  default = "fd84mbm158mu8bgl45cf"
}
