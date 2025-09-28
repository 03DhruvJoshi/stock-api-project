provider "azurerm" {
  features {}
  subscription_id = "9576bfdb-b712-4637-b412-3a39e7359afd"
}

resource "azurerm_resource_group" "rg" {
  name     = "stock-api-rg"
  location = "UK South"
}

resource "azurerm_kubernetes_cluster" "aks" {
  name                = "stock-api-aks"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  dns_prefix          = "stockapi"

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_B2s"
  }

  identity {
    type = "SystemAssigned"
  }
}

resource "azurerm_container_registry" "acr" {
  name                = "stockapiacr123"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  sku                 = "Basic"
  admin_enabled       = true
}
