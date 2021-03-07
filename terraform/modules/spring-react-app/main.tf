resource "azurerm_resource_group" "rg" {
  name     = var.env
  location = var.location
}

resource "azurerm_app_service_plan" "serviceplan" {
  name                = "${var.env}-appserviceplan"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  kind                = "Linux"
  reserved            = true

  sku {
    tier = "Basic"
    size = "B1"
  }
}

resource "azurerm_app_service" "appservice" {
  name                = "${var.name}-${var.env}"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  app_service_plan_id = azurerm_app_service_plan.serviceplan.id

  site_config {
    always_on = true
  }

  app_settings = {}
}