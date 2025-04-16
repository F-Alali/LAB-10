locals {
  resource_group_name = "devops1-FahadAlali-RG"
  vnet_name           = "devops2-vnet"
  location            = "West Europe"
  tags = {
    bootcamp = "DevOps2"
  }
  address_space = ["10.0.0.0/16"]

  subnet = {
    public_subnet = {
      address_space = ["10.0.2.0/24"]
    }
    private_subnet = {
      address_space = ["10.0.3.0/24"]
    }
  }
}
