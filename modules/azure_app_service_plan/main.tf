resource "azurerm_service_plan" "sample_plan" {
  name                = "sample plan"
  resource_group_name = data.azurerm_resource_group.sample.name
  location            = data.azurerm_resource_group.sample.location
  os_type             = "Linux"
  sku_name            = "P1v2"
}

resource "azurerm_linux_web_app" "example" {
  name                = "sample_web_app"
  resource_group_name = data.azurerm_resource_group.sample.name
  location            = azurerm_service_plan.sample_plan.locaion
  service_plan_id     = azurerm_service_plan.sample_plan.id

  site_config {}
}