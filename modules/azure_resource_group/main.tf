resource "azurerm_resource_group" "sample" {
  name     = "sample_resource_group"
  location = "Central US"

  tags = {
    Name = "sample"
  }
}