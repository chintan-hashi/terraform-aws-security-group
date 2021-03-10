#################
# Security group
#################

variable "vpc_id" {
  description = "ID of the VPC where to create security group"
  type        = string
}

variable "name" {
  description = "Name of security group"
  type        = string
}


variable "description" {
  description = "Description of security group"
  type        = string
  default     = "Security Group managed by Terraform"
}



##########
# Ingress
##########

variable "rule_description" {
  description = "Description of ingress rule"
  type        = string
}

variable "from_port" {
  description = "Start Port"
  type        = number
}

variable "to_port" {
  description = "End Port"
  type        = number
}

variable "Protocol" {
  description = "Protocol Name - TCP, UDP etc."
  type        = string
  default     = "TCP"
}

variable "cidr_block" {
  description = "CIDR block for ingress rule"
  type        = list(string)
}
