Terraform Cloud Getting Started Guide Example

This is an example Terraform configuration intended for use with the Terraform Cloud Getting Started Guide.

What will this do?

This is a simple Terraform configuration that will create an a Area, Building, and Floor in DNAC

When you set up a Workspace on Terraform Cloud, you can link to this repository. Terraform Cloud can then run terraform plan and terraform apply automatically when changes are pushed. For more information on how Terraform Cloud interacts with Version Control Systems, see our VCS documentation.

What are the prerequisites?

You must have an DNA Center provider installed 
terraform {
  required_providers {
    dnacenter = {
      source = "cisco-en-programmability/dnacenter"
      version = "0.0.3"
    }
  }
}

The values for 
TF_CLI_CONFIG_FILE=$HOME/main.tf
TF_PLUGIN_CACHE_DIR=
DNAC_BASE_URL=
DNAC_USERNAME=
DNAC_PASSWORD=
