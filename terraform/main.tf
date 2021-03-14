variable "tenant_id" {}
variable "subscription_id" {}
variable "name" {}
variable "location" {}
variable "env" {}

provider "azurerm" {
  features {}
  tenant_id       = var.tenant_id
  subscription_id = var.subscription_id
}

module "app" {
  source   = "./modules/spring-react-app"
  name     = var.name
  env      = var.env
  location = var.location
}