resource "azurerm_mssql_server" "sandbox" {
  name                         = "sandbox-sqlserver"
  resource_group_name          = data.azurerm_resource_group.sample_resource_group.name
  location                     = data.azurerm_resource_group.sample_resource_group.location
  version                      = "12.0"
  administrator_login          = "[SECRET]"
  administrator_login_password = "[SECRET]"
}

resource "azurerm_mssql_database" "cocktails" {
  name         = "cocktails"
  server_id    = azurerm_mssql_server.sandbox.id
  license_type = "LicenseIncluded"
  max_size_gb  = 2
  sku_name     = "S0"

  tags = {
    name = "CocktailsDb"
  }

  # prevent the possibility of accidental data loss
  lifecycle {
    prevent_destroy = true
  }
}