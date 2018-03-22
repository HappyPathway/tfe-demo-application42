variable "ec2_instance_ami_id" {
  description = "ID of the AMI to provision. Default is Ubuntu 14.04 Base Image"
  default = "ami-2e1ef954"
}

variable "ec2_instance_aws_region" {
  description = "AWS region"
  default = "us-east-1"
}

variable "ec2_instance_instance_type" {
  description = "type of EC2 instance to provision."
  default = "t2.micro"
}

variable "ec2_instance_name" {
  description = "name to pass to Name tag"
  default = "Provisioned by Terraform"
}

variable "ec2_instance_owner" {
  description = "The person or organization who launched this module"
  default     = "llarsen"
}

variable "ec2_instance_ttl" {
  description = "Hours until instances are reaped by N.E.P.T.R"
  default = "3"
}

#variable "ec2_instance_description" {
#  description = "Describes things"
#  default = "Foo"
#}

module "ec2_instance" {
  source  = "app.terraform.io/jake-lundberg/ec2-instance/aws"
  version = "1.0.0"

  ami_id        = "${var.ec2_instance_ami_id}"
  aws_region    = "${var.ec2_instance_aws_region}"
  instance_type = "${var.ec2_instance_instance_type}"
  name          = "${var.ec2_instance_name}"
  owner         = "${var.ec2_instance_owner}"
  ttl           = "${var.ec2_instance_ttl}"
  #description  = "${var.ec2_instance_description}"
}
