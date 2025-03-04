resource "azurerm_service_plan" "sample_plan" {
  name                = "sample-plan"
  resource_group_name = data.azurerm_resource_group.sample_resource_group.name
  location            = data.azurerm_resource_group.sample_resource_group.location
  os_type             = "Linux"
  sku_name            = "F1"
}

resource "azurerm_linux_web_app" "barnone_web_app" {
  name                = "barnone-web-app"
  resource_group_name = data.azurerm_resource_group.sample_resource_group.name
  location            = azurerm_service_plan.sample_plan.location
  service_plan_id     = azurerm_service_plan.sample_plan.id
  app_settings = {
    
  }


  site_config {
    always_on = false
    application_stack {
      dotnet_version = "9.0"
    }
  }
}
