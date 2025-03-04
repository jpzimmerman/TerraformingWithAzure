resource "azurerm_api_management" "barnone_api_management" {
  name                = "barnone-api-management"
  location            = data.azurerm_resource_group.sample_resource_group.location
  resource_group_name = data.azurerm_resource_group.sample_resource_group.name
  publisher_name      = "BarNone"
  publisher_email     = "SECRET"
  sku_name            = "Developer_1"

  tags = {
    name = "barnone_api_management"
  }
}
