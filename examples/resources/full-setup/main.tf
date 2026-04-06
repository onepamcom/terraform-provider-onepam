terraform {
  required_providers {
    onepam = {
      source  = "onepamcom/onepam"
      version = "~> 0.1"
    }
  }
}

provider "onepam" {
  host    = var.onepam_host
  api_key = var.onepam_api_key
}

resource "onepam_group" "production" {
  name        = "Production"
  description = "Production infrastructure resources"
}

resource "onepam_resource" "db" {
  name        = "prod-database"
  type        = "database"
  target_host = "db.internal.example.com"
  target_port = 5432
  group_id    = onepam_group.production.id
}

resource "onepam_resource" "web" {
  name        = "prod-web"
  type        = "ssh"
  target_host = "web.internal.example.com"
  target_port = 22
  group_id    = onepam_group.production.id
}

resource "onepam_team" "engineers" {
  name        = "Engineering"
  description = "Engineering team"
}

resource "onepam_policy" "eng_prod" {
  name   = "Engineering Production Access"
  effect = "allow"
  teams  = [onepam_team.engineers.id]
  groups = [onepam_group.production.id]
  actions = ["ssh:connect", "database:connect", "database:query"]
}

variable "onepam_host" { type = string }
variable "onepam_api_key" { type = string; sensitive = true }
