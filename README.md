# infrastructure

### Prerequisites
 
- [Terraform](https://www.terraform.io/downloads.html) installed on your machine.
    from GITHUB: https://github.com/hashicorp/terraform/releases

- Access to your Azure subscription (if deploying to Azure).

- Install Azure CLI: https://learn.microsoft.com/en-us/cli/azure/

- Login to Portal : https://azure.microsoft.com/en-in/get-started/azure-portal
 
## Overview
 
This repository contains a set of Terraform modules organized into a root module and several child modules. 

The root module provides common infrastructure components and configurations. 

which are utilized by the child modules to create specific resourcesgit 
 
 
- **rootmodule**: This directory contains the root module which defines the common infrastructure components and configurations.

- **childmodule**: This directory contains a child module that references the root module to create specific resources.
 