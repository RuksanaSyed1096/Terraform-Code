/*resource "azurerm_resource_group" "RG_01" {
  name     = "Zeta-dev-hyd-RG-01"
  location = "eastus"
  tags = {
    "name" = "orag"
    "arch" = "ruksana"
  }
}
resource "azurerm_network_security_group" "NSG_01" {
  name                = "NSG-dev-hyd-01"
  location            = azurerm_resource_group.RG_01.location
  resource_group_name = azurerm_resource_group.RG_01.name
}

resource "azurerm_virtual_network" "Vnet_01" {
  name          = "zeta-dev-hyd-vnet-01"
  location      = azurerm_resource_group.RG_01.location
  resource_group_name = azurerm_resource_group.RG_01.name
  address_space = ["10.10.0.0/16"]
}
resource "azurerm_subnet" "subnet_01" {
  name                 = "frontend-dev-hyd-01"
  resource_group_name  = azurerm_resource_group.RG_01.name
  virtual_network_name = azurerm_virtual_network.Vnet_01.name
  address_prefixes     = ["10.10.1.0/24"]

}
*/
/*
resource "azurerm_resource_group" "rg_lb" {
  name     = "RG-LB-sit-hyd-01"
  location = "eastus"
  tags = {
    "name"          = "SIT-RG",
    "Load balancer" = "internet"
  }

}
resource "azurerm_public_ip" "lb_pubip" {
  name                = "LB-pubip"
  location            = azurerm_resource_group.rg_lb.location
  resource_group_name = azurerm_resource_group.rg_lb.name
  allocation_method   = "Static"
}
resource "azurerm_lb" "lb" {
  name                = "LB-sit-hyd-01"
  location            = azurerm_resource_group.rg_lb.location
  resource_group_name = azurerm_resource_group.rg_lb.name

  frontend_ip_configuration {
    name                 = "Publicipaddress"
    public_ip_address_id = azurerm_public_ip.lb_pubip.id
  }

}
resource "azurerm_lb_backend_address_pool" "lb_backend_pool" {
  loadbalancer_id = azurerm_lb.lb.id
  name            = "BackendAddressPool"

}
*/

/*resource "azurerm_resource_group" "rg_hyd_01" {
  name     = "RG-prod-hyd-01"
  location = "eastus"
}
resource "azurerm_virtual_network" "vnet_hyd_01" {
  name                = "Vnet-prod-hyd-01"
  location            = azurerm_resource_group.rg_hyd_01.location
  resource_group_name = azurerm_resource_group.rg_hyd_01.name
  address_space       = var.address_space

}
resource "azurerm_subnet" "subnet_01" {
  name                 = "Frontend"
  virtual_network_name = azurerm_virtual_network.vnet_hyd_01.name
  resource_group_name  = azurerm_resource_group.rg_hyd_01.name
  address_prefixes     = var.address_prefixes
}
resource "azurerm_network_interface" "hyd_nic" {
  name                = "ipaddress-nic"
  location            = azurerm_resource_group.rg_hyd_01.location
  resource_group_name = azurerm_resource_group.rg_hyd_01.name

  ip_configuration {
    name                          = "frontend-ip"
    subnet_id                     = azurerm_subnet.subnet_01.id
    private_ip_address_allocation = "Dynamic"
  }

}
resource "azurerm_windows_virtual_machine" "vm_01" {
  name                = "Vm-prod-hyd-win-01"
  location            = azurerm_resource_group.rg_hyd_01.location
  resource_group_name = azurerm_resource_group.rg_hyd_01.name
  #virtual_network_name = azurerm_virtual_network.vnet_hyd_01.name
  computer_name  = var.computer_name
  size           = "Standard_F2"
  admin_username = "azadmin"
  admin_password = var.admin_password
  network_interface_ids = [
    azurerm_network_interface.hyd_nic.id
  ]
  os_disk {
    caching              = var.caching
    storage_account_type = "Standard_LRS"
  }
  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
  }
}
*/


module "resource_group_name" {
  source = "./Resource-Group"
  rg_name = "dev-hyd-01"
  location = "eastus"
  
}
module "storageacccount" {
  source = "./Storage-Account"
  storagename = "RUKSANA"
  resource_group_name = module.resource_group_name.rg_out
  location = "eastus"
  
}
