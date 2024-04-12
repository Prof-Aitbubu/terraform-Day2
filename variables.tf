# variables.tf

variable "region" {
  description = "AWS region"
  type        = string
}

variable "vpc_cidr_block" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "subnet1_cidr_block" {
  description = "CIDR block for Subnet 1"
  type        = string
}

variable "subnet2_cidr_block" {
  description = "CIDR block for Subnet 2"
  type        = string
}

variable "availability_zone1" {
  description = "Availability zone for Subnet 1"
  type        = string
}

variable "availability_zone2" {
  description = "Availability zone for Subnet 2"
  type        = string
}

variable "instance_type" {
  description = "Instance type for the EC2 instance"
  type        = string
}
