# OnePAM Terraform Provider

[![Terraform Registry](https://img.shields.io/badge/registry-onepamcom%2Fonepam-blue.svg)](https://registry.terraform.io/providers/onepamcom/onepam)
[![License: MPL 2.0](https://img.shields.io/badge/License-MPL_2.0-brightgreen.svg)](https://opensource.org/licenses/MPL-2.0)

Terraform provider for managing [OnePAM](https://onepam.com) resources, teams, policies, and gateways.

## Requirements

- Terraform >= 1.0

## Installation

```hcl
terraform {
  required_providers {
    onepam = {
      source  = "onepamcom/onepam"
      version = "~> 0.1"
    }
  }
}
```

## Authentication

```hcl
provider "onepam" {
  host    = "https://onepam.example.com"
  api_key = var.onepam_api_key  # or set ONEPAM_API_KEY env var
}
```

## Quick Start

```hcl
resource "onepam_group" "production" {
  name        = "Production Servers"
  description = "All production infrastructure"
}

resource "onepam_resource" "web_server" {
  name        = "web-prod-01"
  type        = "ssh"
  target_host = "10.0.1.50"
  target_port = 22
  group_id    = onepam_group.production.id
}

resource "onepam_team" "sre" {
  name        = "SRE Team"
  description = "Site Reliability Engineers"
}

resource "onepam_policy" "sre_prod_access" {
  name   = "SRE Production Access"
  effect = "allow"
  teams  = [onepam_team.sre.id]
  groups = [onepam_group.production.id]
  actions = ["ssh:connect", "ssh:sudo"]
}
```

## Resources

| Resource | Description |
|----------|-------------|
| `onepam_resource` | SSH servers, databases, RDP hosts, web apps |
| `onepam_group` | Resource groups |
| `onepam_team` | User teams |
| `onepam_user` | User accounts |
| `onepam_policy` | Access policies |
| `onepam_gateway` | Gateway registrations |

## Data Sources

| Data Source | Description |
|-------------|-------------|
| `onepam_resource` | Look up an existing resource |
| `onepam_group` | Look up an existing group |

## Documentation

- [Provider Docs](docs/index.md)
- [OnePAM Docs](https://onepam.com/docs)
- [Terraform Deployment Modules](https://github.com/onepamcom/onepam-terraform)
