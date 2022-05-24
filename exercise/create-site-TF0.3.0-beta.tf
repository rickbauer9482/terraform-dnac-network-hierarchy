# this plan reflects the new changes to the terraform dna center provider 0.3.0-beta

# Configure provider with your Cisco DNA Center SDK credentials

provider "dnacenter" {
  # Cisco DNA Center user name
#   username = "XXXXXXXXX"
  # it can be set using the environment variable DNAC_USERNAME

  # Cisco DNA Center password
#   password = "XXXXXX"
  # it can be set using the environment variable DNAC_PASSWORD

  # Cisco DNA Center base URL, FQDN or IP
#   base_url = "https://Y.Y.Y.Y"
  # it can be set using the environment variable DNAC_BASE_URL

  # Boolean to enable debugging
    debug = "false"
  # it can be set using the environment variable DNAC_DEBUG

  # Boolean to enable or disable SSL certificate verification
    ssl_verify = "false"
  # it can be set using the environment variable DNAC_SSL_VERIFY
}

resource "dnacenter_site" "area" {
  provider = dnacenter
  parameters {
    site {
      area {
        name        = "Terraform-Site"
        parent_name = "Global"
      }
    }
    type = "area"
  }
}
resource "dnacenter_site" "building" {
  provider = dnacenter
  depends_on = [ dnacenter_site.area ]
  parameters {
    site {
      building {
        name        = "Building SEA1"
        address     = "100 Main Street, Seattle, WA 98121"
        parent_name = "Global/Terraform-Site"
      }
    }
    type = "building"
  }
}
resource "dnacenter_site" "floor" {
  provider = dnacenter
  depends_on = [ dnacenter_site.building ]
  parameters {
    site {
      floor {
        height      = 10.0
        length      = 200.0
        width       = 400.0
        name        = "Floor 100"
        parent_name = "Global/Terraform-Site/Building SEA1"
        rf_model    = "Drywall Office Only"
      }
    }
    type = "floor"
  }
}

output "dnacenter_site_area" {
  value = dnacenter_site.area
}

output "dnacenter_site_building" {
  value = dnacenter_site.building
}

output "dnacenter_site_floor" {
  value = dnacenter_site.floor
}
