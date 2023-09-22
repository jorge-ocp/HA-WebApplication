variable "resource_group" {
  description = "resource group name"
  type        = string
}

variable "vm_name" {
  description = "name for linux vm"
  type        = string

  /* validation {
      condition = length(var.vm_name) <= 15
      error_message = "Err: name lenght too long, must best less than 15"
    }   */
}

variable "location" {
  description = <<EOT
    The location for the resources

    Options:
    - eastus
    - westus
    - southcentralus
    
    Default: none
    EOT
  type        = string

  /* validation {
      condition = can(regex("eastus|westus|southcentralus", var.location))
      error_message = "Err: Invalid Location"
    }  */
}


variable "subnet_id" {
  description = "subnet id for network interface"
  type        = string

}

variable "adminusername" {
  description = "username for linux vm"
  type        = string
  sensitive   = true

}

variable "adminpassword" {
  description = "password for admin"
  type        = string
  sensitive   = true

}

locals {
  instance_types = {
    dev   = "Standard_B1s"
    stage = "Standard_B2s"
  }
}
