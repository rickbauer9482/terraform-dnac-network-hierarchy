# Cisco DNA Center with Terraform Infrastructure as Code 
Terraform is an open-source infrastructure as code software tool that provides a consistent CLI workflow to manage hundreds of cloud services. Terraform codifies cloud APIs into declarative configuration files. Terraform allows infrastructure to be expressed as code in a simple, human readable language called HCL (HashiCorp Configuration Language). It reads configuration files and provides an execution plan of changes, which can be reviewed for safety and then applied and provisioned.

Extensible providers allow Terraform to manage a broad range of resources, including IaaS, PaaS, SaaS, and hardware services.

There is tremendous potential using Terraform with Cisco DNA Center to improve your configuration quality and to improve your adoption of the controller. Being able to define how your infrastructure will be designed and configured programmatically not only saves time but it also improves the overall hygiene through consistency. 

# What are we going to do?
In this lab we will explore how Terraform can be used to design and configure Cisco DNA Center site hierarchy to accelerate your Cisco DNA Center adoption. 

# Some terms to understand

Declarative vs. Imperative (Procedural)

•	Declarative configuration is the description of the how the system should look or operate

•	Imperative configuration is the configuration steps in sequence to make the system operate

Immutable vs. Mutable

•	Immutable – not to be changed, so rather than modifying the configuration the entire component is replaced which makes it more reproducible and eliminate configuration drift (Snowflakes)

•	Mutable – the configuration can be modified so there is the risk of drift and configuration control must be addressed to ensure all components are configured the same

# Why Terraform and not something else?
Tools like Ansible, Puppet, Chef, and SaltStack are configuration management tools, that are used to install and manage software on existing servers. 

Terraform is a provisioning tool, that you would use it to provision the servers as well as the rest of your infrastructure (load balancers, databases, network infrastructure, etc) where the configuration would be done with another tool.

# Terraform vs. Ansible

![](images/terraform-ansible.jpg)
