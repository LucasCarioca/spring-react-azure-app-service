variable "tenant_id" {}
variable "subscription_id" {}

provider "azurerm" {
  version = ">= 2.0"
  features {}
  tenant_id       = var.tenant_id
  subscription_id = var.subscription_id
}

module "app" {
  source   = "./modules/spring-react-app"
  name     = "examplespringreactapp"
  env      = "non-prod"
  location = "Central US"
}