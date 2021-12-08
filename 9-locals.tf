locals {
  Common_tags = {
    Environment = "${var.env[0]}"
    costcenter  = "${var.costcenter}"
    Role        = "${var.role}"
    Deployment  = "Terraform"

  }

  nonprod_tags = {
    Application = "${var.application[4]}"

  }
  soa_tags = {
    Application = "${var.application[0]}"

  }
  fit_tags = {
    Application = "${var.application[1]}"

  }
  trio_tags = {
    Application = "${var.application[2]}"

  }
  ptc_tags = {
    Application = "${var.application[3]}"

  }
  db_tags = {
    Application = "${var.application[5]}"

  }

  webappsperloc = [
    for name in chunklist(var.soa_dev_webapp_name, 20) : name
  ]

}
