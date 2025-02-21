resource "azurerm_resource_group" "sample" {
  name     = "sample_resource_group"
  location = "East US"

  tags = {
    Name = "sample"
  }
}