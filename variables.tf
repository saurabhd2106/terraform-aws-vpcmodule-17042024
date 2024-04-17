variable "cidr_block" {

  type        = string
  description = "This is the IP range for the VPC"
  default     = "10.0.0.0/16"
}

variable "vpc_name" {

  type    = string
  default = "myVpc"
}

variable "subnet1_name" {

  type = string
}

variable "subnet2_name" {

  type = string
}

variable "public_subnet_cidr_block" {

  type = string

}

variable "private_subnet_cidr_block" {

  type = string

}

variable "availability_zone" {

  type = map(string)

}

variable "ig_name" {

  type = string

}

variable "ami_image" {

  type = string

}

variable "instance_type" {

  type = string

}

variable "subnet" {

  type = any
}

variable "inbound_rule" {

  type = any

}