module "resource_group" {
  source = "../azurerm_resource_group"  # تأكد أن المسار هذا صحيح
  name   = local.resource_group_name
  location = local.location
  tags    = local.tags
}

module "vnet" {
  source = "../azurerm_virtual_network"  # تأكد أن المسار هذا صحيح
  name = local.vnet_name
  resource_group_name = module.resource_group.resource_group.name
  location = local.location
  address_space = local.address_space
  tags = local.tags
}

module "subnets" {
  source = "../Subnets"  # تأكد أن المسار هذا صحيح
  for_each = local.subnet
  name = each.key
  resource_group_name = module.resource_group.resource_group.name
  vnet_name = module.vnet.virtual_network.name
  address_prefixes = each.value.address_space
}
