module "names" {
  source = "git::ssh://git@github.com/appnetwise/terraform_modules.git//modules/names?ref=tf-skb"

  environment    = var.environment
  location       = var.location
  id             = var.id
  resource_types = var.resource_types
  random_suffix  = false
  prefix_transforms = [
    {
      resource_type = "azurerm_subnet"
      search        = "snet"
      replace       = "sn"
    }
  ]
}