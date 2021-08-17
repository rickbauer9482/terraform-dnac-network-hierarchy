
Infrastructure as Code with Terraform
Terraform is an increasingly popular open-source infrastructure as code software tool built by HashiCorp. It enables administrators to define, provision and manage infrastructure across multiple cloud and datacenter resources. Terraform takes an infrastructure as code approach by using using a high-level configuration language known as Hashicorp Configuration Language or JSON to define the resources. Terraform differs from traditional configuration management tools such as Ansible as it is known for keeping state of the infrastructure, once you define your desired state through Terraform config files. Terraform looks to build your infrastructure, records its current state and always looks to maintain the desired state the config specifies. 
While Terraform has been increasingly used in the cloud space to provision infrastructure such as VMWare, AWS and Azure, we're starting to see more and more usage of this with Cisco infrastructure with support today for ASA firewalls, Cisco ACI in the data center, and DNA Center in the campus. Within these exercises we'll look to focus on how Terraform can be used to configure DNA Center and provision resources in today's enterprise IT environment.

![terraform-1](https://user-images.githubusercontent.com/19711276/129754823-868f3028-114a-4ecb-b944-16842d1956e8.gif)


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
