terraform {
  required_providers {
    dnacenter = {
      source  = "cisco-en-programmability/dnacenter"
      version = "0.0.3"
    }
  }
}
terraform {
  backend "remote" {
    organization = "TSA-EN-AI"

    workspaces {
      name = "terraform-dnac-network-hierarchy"
    }
  }
}
