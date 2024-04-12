# This is my "main.tf" file: It includes 1 VPC, 2 Subnets,1 EC2 Instance inside Subnet 2 with Amazon Linux image and Outputs:

# First I defined my provider (AWS):

provider "aws" {
  region = var.region
}

# I created my VPC:
resource "aws_vpc" "Aitbubu_vpc" {
  cidr_block = var.vpc_cidr_block
}

# I created my Subnets:
resource "aws_subnet" "subnet1" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = var.subnet1_cidr_block
  availability_zone = var.availability_zone1
}

resource "aws_subnet" "subnet2" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = var.subnet2_cidr_block
  availability_zone = var.availability_zone2
}

# Then I get Amazon Linux AMI ID:
data "aws_ami" "amazon_linux" {
  most_recent = true

  filter {
    name   = "image-id"
    values = ["ami-051f8a213df8bc089"]
  }
  }

# Create EC2 Instance
resource "aws_instance" "my_ec2_instance" {
  ami           = data.aws_ami.amazon_linux.id
  instance_type = var.instance_type
  subnet_id     = aws_subnet.subnet2.id
}

# Output values
output "instance_id" {
  value       = aws_instance.my_ec2_instance.id
  description = "ID of the created EC2 instance"
}

output "subnet_ids" {
  value       = [aws_subnet.subnet1.id, aws_subnet.subnet2.id]
  description = "IDs of the created subnets"
}

output "vpc_id" {
  value       = aws_vpc.my_vpc.id
  description = "ID of the created VPC"
}

output "vpc_cidr_block" {
  value       = aws_vpc.my_vpc.cidr_block
  description = "CIDR block of the created VPC"
}
