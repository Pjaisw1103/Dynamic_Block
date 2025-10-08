resource "azurerm_virtual_network" "vnet" {
  name                = "demo-vnet"
  location            = "WestEurope"
  resource_group_name = "demo-rg"
  address_space       = ["10.0.0.0/16"]

dynamic "subnet" {
  for_each = var.subnets
  content {
    name = subnet.value.subnet-name
    address_prefixes = subnet.value.address_prefixes
  }
}
}