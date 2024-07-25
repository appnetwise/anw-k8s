module "names" {
  source = "git::ssh://git@github.com/appnetwise/terraform_modules.git//names?ref=main"

  environment    = var.environment
  location       = var.location
  id             = var.id
  resource_types = var.resource_types
  random_suffix  = false
  prefix_transforms = [
    {
      resource_type = "azurerm_resource_group"
      search        = "arg"
      replace       = "rg"
    }
  ]
}