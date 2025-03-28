variable "servers" {
  type        = string
  description = "Server names"
  default     = "whatever"
}

variable "region" {
  default = "us-east-1"
}

variable "machine_type" {
  type    = string
  default = "ami-084568db4383264d4"
}

variable "virtual_machine1" {
  type        = string
  description = "This is the Ec2 instance type"
  default     = "t2.micro"
}