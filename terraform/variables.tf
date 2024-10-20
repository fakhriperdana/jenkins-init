variable "ami" {
  default = "ami-04b6019d38ea93034" # Amazon Linux 2023 ap-southeast-1
}

variable "aws_region" {
  default = "ap-southeast-1"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "key_name" {
  default = "dummy-key"
}

variable "vpc_security_group_ids" {
  type = list(string)
  default = []
}
