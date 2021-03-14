variable "tenant_id" {}
variable "subscription_id" {}
variable "be_name" {}
variable "fe_name" {}
variable "location" {}
variable "env" {}

provider "azurerm" {
  features {}
  tenant_id       = var.tenant_id
  subscription_id = var.subscription_id
}

module "app" {
  source   = "./modules/spring-react-app"
  env      = var.env
  location = var.location
  fe_name  = var.fe_name
  be_name  = var.be_name
}