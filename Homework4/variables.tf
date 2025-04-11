variable "region" {
  type        = string
  default     = "us-east-2"
}

variable "vpc" {
  type = list(object({
    cidr_block           = string
    enable_dns_support   = bool
    enable_dns_hostnames = bool
  }))

  default = [
    {
      cidr_block           = "10.0.0.0/16"
      enable_dns_support   = true
      enable_dns_hostnames = true
    }
  ]
}


variable "subnets" {
  type = list(object({
    cidr_block        = string
    availability_zone = string
    auto_assign_ip    = bool
    name              = string
  }))
  

  default = [
    {
      cidr_block        = "10.0.1.0/24"
      availability_zone = "us-east-2a"
      auto_assign_ip    = true
      name              = "public-subnet-1"
    },
    {
      cidr_block        = "10.0.2.0/24"
      availability_zone = "us-east-2b"
      auto_assign_ip    = true
      name              = "public-subnet-2"
    },
    {
      cidr_block        = "10.0.3.0/24"
      availability_zone = "us-east-2c"
      auto_assign_ip    = false
      name              = "private-subnet-1"
    },
    {
      cidr_block        = "10.0.4.0/24"
      availability_zone = "us-east-2d"
      auto_assign_ip    = false
      name              = "private-subnet-2"
    }
  ]
}


variable "igw_name" {
  type        = string
  default     = "main-igw"
}


variable "route_table_names" {
  type        = list(string)
  default     = ["public-rt", "private-rt"]
}


variable "port" {
  type        = list(number)

  default     = [22, 80, 443, 3306]
}


variable "ec2" {
  type = map(string)

  default = {
    ami           = "ami-0c55b159cbfafe1f0"
    instance_type = "t2.micro"
  }
}


variable "aws_key" {
  type        = string
  default     = "deployer-key"
}