# VPC Name Variable

variable "exist_vpc_name" {}


# AMI ID Map Variable

variable "ec2_ami_ids" {
  type = map(string)

  default = {
    ubuntu   = "ami-036841078a4b68e14"
    ec2-user = "ami-0b4624933067d393a"
  }
}


variable "instance_tag" {}


variable "instance_type" {}


variable "instance_key" {}

variable "exist_sg" {}

variable "exist_subnet" {}

variable "enter_user_name_based_on_ami" {}