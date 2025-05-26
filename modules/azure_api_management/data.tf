data "azurerm_resource_group" "sample_resource_group" {
  name = "sample_resource_group"
}

data "azurerm_linux_web_app" "barnone_api_service" {
  name = "barnone-web-app"
  resource_group_name = data.azurerm_resource_group.sample_resource_group.name
}