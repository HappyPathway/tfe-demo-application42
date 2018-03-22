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

# GCP instance information
variable "compute_instance_gcp_credentials" {
  description = "GCP credentials needed by google provider"
}

variable "compute_instance_gcp_project" {
  description = "GCP project name"
}

variable "compute_instance_gcp_region" {
  description = "GCP region, e.g. us-east1"
  default = "us-east1"
}

variable "compute_instance_gcp_zone" {
  description = "GCP zone, e.g. us-east1-a"
  default = "us-east1-b"
}

variable "compute_instance_image" {
  description = "image to build instance from"
  default = "debian-cloud/debian-8"
}
variable "compute_instance_instance_name" {
  description = "GCP instance name"
  default = "app42-instance"
}
variable "compute_instance_machine_type" {
  description = "GCP machine type"
  default = "n1-standard-1"
}

module "compute_instance" {
  source  = "app.terraform.io/jake-lundberg/compute-instance/gpc"
  version = "1.0.0"

  gcp_credentials = "${var.compute_instance_gcp_credentials}"
  gcp_project     = "${var.compute_instance_gcp_project}"
  gcp_region      = "${var.compute_instance_gcp_region}"
  gcp_zone        = "${var.compute_instance_gcp_zone}"
  image           = "${var.compute_instance_image}"
  instance_name   = "${var.compute_instance_instance_name}"
  machine_type    = "${var.compute_instance_machine_type}"
}
