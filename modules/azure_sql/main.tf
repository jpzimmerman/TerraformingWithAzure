resource "azurerm_resource_group" "sandbox_rg" {
  name     = "example-resources"
  location = "eastus"
}

resource "azurerm_mssql_server" "sandbox" {
  name                         = "sandbox-sqlserver"
  resource_group_name          = azurerm_resource_group.sandbox_rg.name
  location                     = azurerm_resource_group.sandbox_rg.location
  version                      = "12.0"
  administrator_login          = "[SECRET]"
  administrator_login_password = "[SECRET]"
}

resource "azurerm_mssql_database" "sandbox_db" {
  name         = "sandbox_db"
  server_id    = azurerm_mssql_server.sandbox.id
  license_type = "LicenseIncluded"
  max_size_gb  = 2
  sku_name     = "S0"

  tags = {
    name = "SandboxDb"
  }

  # prevent the possibility of accidental data loss
  lifecycle {
    prevent_destroy = true
  }
}