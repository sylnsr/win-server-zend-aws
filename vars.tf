# AWS variables
variable "aws_profile" {
  type = string
  description = "AWS credentials profile to use"
  default = "default"
}

variable "aws_zone" {
  type = string
  description = "AWS availability zone to deploy to"
  default = "us-west-2b"
}

variable "aws_vpc_id" {
  type = string
  description = "ID of an existing VPC to use"
}

variable "public_cidr" {
  type        = string
  description = "CIDR for the public subnet"
  default     = "172.31.1.0/24"
}


# Windows instance variables
variable "win_instance_name" {
  type        = string
  description = "EC2 instance name for Windows server instance"
  default     = "winsrv01"
}
variable "win_instance_type" {
  type        = string
  description = "EC2 instance type for Windows Server"
  default     = "t2.micro"
}
variable "win_associate_public_ip_address" {
  type        = bool
  description = "Associate a public IP address to the EC2 instance"
  default     = true
}
## Root volume
variable "win_root_volume_size" {
  type        = number
  description = "Root volume size for Windows server instance"
  default     = "30"
}
variable "win_root_volume_type" {
  type        = string
  description = "Root volume type for Windows server instance"
  default     = "gp2"
}
## Data volume
variable "win_data_volume_size" {
  type        = number
  description = "Data volume size for Windows server instance"
  default     = "10"
}
variable "win_data_volume_type" {
  type        = string
  description = "Data volume type for Windows server instance"
  default     = "gp2"
}



