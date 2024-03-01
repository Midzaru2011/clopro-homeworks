#Публичная сеть и ВМ
resource "yandex_vpc_network" "netology-network" {
  name = var.vpc_name
}

resource "yandex_vpc_subnet" "public" {
  name           = "public-subnet"
  zone           = var.default_zone
  network_id     = yandex_vpc_network.netology-network.id
  v4_cidr_blocks = var.subnet_cidr
}