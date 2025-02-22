resource "azurerm_resource_group" "sample" {
  name     = "sample_resource_group"
  location = "East US 2"

  tags = {
    Name = "sample"
  }
}