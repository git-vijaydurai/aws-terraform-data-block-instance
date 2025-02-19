# Retrieve the existing VPC by name

data "aws_vpc" "exist_vpc" {
  filter {
    name   = "tag:Name"
    values = [var.exist_vpc_name]
  }
}

# Retrieve an existing subnet within the VPC

data "aws_subnet" "exist_subnet" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.exist_vpc.id]
  }
  filter {
    name   = "tag:Name"
    values = [var.exist_subnet]
  }
}

# Retrieve an existing security group

data "aws_security_group" "exist_sg" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.exist_vpc.id]
  }
  filter {
    name   = "tag:Name"
    values = [var.exist_sg]
  }
}

# Create an EC2 instance in the existing VPC and subnet

resource "aws_instance" "instance" {
  ami                    = var.ec2_ami_ids["${var.enter_user_name_based_on_ami}"]
  instance_type          = var.instance_type
  subnet_id              = data.aws_subnet.exist_subnet.id
  vpc_security_group_ids = [data.aws_security_group.exist_sg.id]
  key_name               = var.instance_key

  tags = {
    Name = var.instance_tag
  }
}
