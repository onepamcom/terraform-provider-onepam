terraform {
  required_providers {
    onepam = {
      source  = "onepamcom/onepam"
      version = "~> 0.1"
    }
  }
}

provider "onepam" {
  host    = "https://onepam.example.com"
  api_key = var.onepam_api_key
}

variable "onepam_api_key" {
  type      = string
  sensitive = true
}
