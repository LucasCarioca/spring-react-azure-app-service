terraform {
  backend "azurerm" {
    storage_account_name = "desouza"
    container_name       = "terraform-state"
    key                  = "spring-react-azure-app-service.tfstate"
    resource_group_name  = "common"
  }
}