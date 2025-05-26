resource "azurerm_api_management" "barnone_api_management" {
  name                = "barnone"
  location            = data.azurerm_resource_group.sample_resource_group.location
  resource_group_name = data.azurerm_resource_group.sample_resource_group.name
  publisher_name      = "SECRET"
  publisher_email     = "SECRET"
  sku_name            = "Developer_1"

  tags = {
    name = "barnone_api_management"
  }
}

resource "azurerm_api_management_api" "barnone_api" {
  display_name        = "barnone"
  protocols           = ["https"]
  revision            = "1"
  api_management_name = azurerm_api_management.barnone_api_management.name
  name                = "barnone-api"
  resource_group_name = data.azurerm_resource_group.sample_resource_group.name
  path                = ""
  service_url         = "https://${data.azurerm_linux_web_app.barnone_api_service.default_hostname}"
  depends_on          = [azurerm_api_management.barnone_api_management]
}

moved {
  from = azurerm_api_management_backend.example
  to   = azurerm_api_management_backend.barnone_backend
}

resource "azurerm_api_management_backend" "barnone_backend" {
  name                = "barnone-backend"
  resource_group_name = data.azurerm_resource_group.sample_resource_group.name
  api_management_name = azurerm_api_management.barnone_api_management.name
  protocol            = "http"
  url                 = "https://${azurerm_api_management_api.barnone_api.display_name}.azure-api.net/api"
}

resource "azurerm_api_management_api_operation" "get_operation" {
  operation_id        = "user-get-items"
  api_name            = azurerm_api_management_api.barnone_api.name
  api_management_name = azurerm_api_management_api.barnone_api.api_management_name
  resource_group_name = data.azurerm_resource_group.sample_resource_group.name
  method              = "GET"
  url_template        = "/api/menu/GetMenuItems"
  display_name        = "Get Menu Items operation"

  response {
    status_code = 200
  }
}
