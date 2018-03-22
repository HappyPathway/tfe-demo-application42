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
