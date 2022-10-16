module "master_module-1" {
  source = ".//module-1"
  masterec2_instance_type = var.master_ec2instance
  count = var.master_count
  master_name = var.master_tag
}
module "slave_module-1" {
  source = ".//module-2"
  slaveec2_instance_type = var.slave_ec2instance
  count = var.slave_count
  slave_name = var.slave_tag
}
