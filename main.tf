variable "private-repo-source" {
  description = "Private SaaS repo source"
  default     = "app.terraform.io/jake-lundberg/ec2-instance/aws"
}

variable "private-repo-version" {
  description = "Version of this module to use"
}

variable "environment" { 
  description = "Release environment that can be added to names and tags to differentiate nodes in the same account"
  default     = "dev"
}

variable "owner" {
  description = "The person or organization who launched this module"
  default     = "llarsen"
}

variable "ttl" {
  description = "Hours until instances are reaped by N.E.P.T.R"
  default = "3"
}

variable "aws_region" {
  description = "AWS region"
  default = "us-east-1"
}

module "ec2-instance" {
  source     = "app.terraform.io/jake-lundberg/ec2-instance/aws"
  version    = "${var.private-repo-version}"
  aws_region = "${var.aws_region}"
  name       = "${var.owner}-tfe-demo-${var.environment}"
  owner      = "${var.owner}@"
  ttl        = "${var.ttl}"
}

output "public_dns" {
  value = "${module.ec2-instance.aws_instance.ubuntu.public_dns}"
}
