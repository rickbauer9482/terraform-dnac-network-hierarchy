
# Configure provider with your Cisco DNA Center SDK credentials

provider "dnacenter" {
  # Cisco DNA Center user name
  # username = "admin"
  # it can be set using the environment variable DNAC_USERNAME

  # Cisco DNA Center password
  # password = "@$@#%%@#$"
  # it can be set using the environment variable DNAC_PASSWORD

  # Cisco DNA Center base URL, FQDN or IP
  # base_url = "https://x.x.x.x"
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
    username        = "${var.username}"
    password        = "${var.password}"
    credential_type = "APP"
  }
}
output "dna_cli_credential_response" {
  value = dna_cli_credential.response
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
output "site_area" {
  value = dna_site.area
}

### Add Building
resource "dna_site" "building_1" {
  provider   = dnacenter
  depends_on = [dna_site.area]
  item {
    type        = "building"
    name        = "29HWT"
    parent_name = "Global/USA/New Jersey"
    address     = "29 Heighwood Trail, Sparta, New Jersey, 07871"
  }
}
output "site_building_1" {
  value = dna_site.building_1
}

### Add Floor
resource "dna_site" "floor_1" {
  provider   = dnacenter
  depends_on = [dna_site.building_1]
  item {
    type        = "floor"
    name        = "Floor 1"
    parent_name = "Global/USA/New Jersey/29HWT"
    rf_model = "Drywall Office Only"
    height = 10.1
    length = 200.2
    width = 400.1
  }
}
output "site_floor_1" {
  value = dna_site.floor_1
}
