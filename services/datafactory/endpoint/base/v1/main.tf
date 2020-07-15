resource "azurerm_data_factory" "datafactory" {
  name                = var.service_settings.name
  location            = var.context.location
  resource_group_name = var.context.resource_group_name

  tags = {
    app = var.context.application_name
    env = var.context.environment_name
  }
}