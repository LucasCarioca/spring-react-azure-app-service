variable "tenant_id" {}
variable "subscription_id" {}

provider "azurerm" {
  features {}
  tenant_id       = var.tenant_id
  subscription_id = var.subscription_id
}

module "app" {
  source   = "./modules/spring-react-app"
  name     = "springreact"
  env      = "nonprod"
  location = "Central US"
}