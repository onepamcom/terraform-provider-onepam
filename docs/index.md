---
page_title: "OnePAM Provider"
description: "The OnePAM provider manages resources in your OnePAM Zero Trust PAM platform."
---

# OnePAM Provider

The OnePAM provider allows you to manage resources, teams, policies, and gateways in your [OnePAM](https://onepam.com) deployment using Terraform.

## Example Usage

```hcl
provider "onepam" {
  host    = "https://onepam.example.com"
  api_key = var.onepam_api_key
}
```

## Authentication

The provider can be configured with the `api_key` argument or the `ONEPAM_API_KEY` environment variable.

Generate an API key from the OnePAM web UI under **Settings > API Keys**.

## Schema

### Required

- `host` (String) — The URL of your OnePAM server.
- `api_key` (String, Sensitive) — API key for authentication. Can also be set via `ONEPAM_API_KEY`.
