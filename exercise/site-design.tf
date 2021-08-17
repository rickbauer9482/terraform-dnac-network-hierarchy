# Configure provider with your Cisco DNA Center SDK credentials

provider "dnacenter" {
  # Cisco DNA Center user name
  # username = "admin"
  # username = "DNAC_USERNAME"
  # it can be set using the environment variable DNAC_USERNAME

  # Cisco DNA Center password
  # password = "c15c0123!"
  # password = "DNAC_PASSWORD"
  # it can be set using the environment variable DNAC_PASSWORD

  # Cisco DNA Center base URL, FQDN or IP
  # base_url = "{DNAC_BASE_URL}"
  # it can be set using the environment variable DNAC_BASE_URL


  # Boolean to enable debugging
  debug = "false"
  # it can be set using the environment variable DNAC_DEBUG

  # Boolean to enable or disable SSL certificate verification
  ssl_verify = "false"
  # it can be set using the environment variable DNAC_SSL_VERIFY
}

# Configure CLI credential

resource "dna_cli_credential" "response" {
  provider = dnacenter
  item {
    username        = "{DNAC_USERNAME}"
    password        = "{DNAC_PASSWORD}"
    credential_type = "APP"
  }
}

### Add Area
resource "dna_site" "area" {
  provider = dnacenter
  item {
    type        = "area"
    name        = "New Jersey"
    parent_name = "Global/USA"
  }
}

### Add Building
resource "dna_site" "building_1" {
  provider   = dnacenter
  depends_on = [ dna_site.area ]
  item {
    type        = "building"
    name        = "Building 1 Iselin"
    parent_name = "Global/USA/New Jersey"
    address     = "100 Wood Avenue, Iselin, New Jersey 08830"
  }
}

### Add Floor
resource "dna_site" "floor_1" {
  provider   = dnacenter
  depends_on = [ dna_site.building_1 ]
  item {
    type        = "floor"
    name        = "Floor 1"
    parent_name = "Global/USA/New Jersey/Building 1 Iselin"
    rf_model = "Drywall Office Only"
    height = 10.0
    length = 200.0
    width = 400.0
  }
}
