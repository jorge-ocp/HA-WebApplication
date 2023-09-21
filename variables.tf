variable "subscription_id" {
  description = "subscription where resource will be created"
  type        = string
  sensitive   = true
}

variable "client_id" {
  description = "client id"
  type        = string
  sensitive   = true
}

variable "tenant_id" {
  description = "tenant id"
  type        = string
  sensitive   = true
}

variable "client_secret" {
  description = "client secret"
  type        = string
  sensitive   = true
}

variable "resource_group" {
  description = "azure resource group"
  type        = string
  default     = "terraform-deployments"

}

variable "environment" {
  type = string

}

variable "location" {
  type = string

}
