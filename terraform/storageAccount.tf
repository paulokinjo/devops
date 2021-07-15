resource "azurerm_storage_account" "stor" {
  name                     = "bookstorpackt123"
  location                 = var.location
  resource_group_name      = azurerm_resource_group.rg.name
  account_tier             = "Standard"
  account_replication_type = "LRS"
}