variable "ingressdescription_a" {
 default = "HTTP"
}
variable "ingressfromport_a" {
 default = "80"
}
variable "ingresstoport_a" {
 default = "80"
}
variable "ingressprotocol_a" {
 default = "tcp"
}
variable "ingressdescription_b" {
 default = "SSH"
}
variable "ingressfromport_b" {
 default = "22"
}
variable "ingresstoport_b" {
 default = "22"
}
variable "ingressprotocol_b" {
 default = "tcp"
}
variable "egressdescription" {
 default = "outbound rules"
}
variable "egressfromport" {
 default = "0"
}
variable "egresstoport" {
 default = "0"
}
variable "egressprotocol" {
 default = "-1"
}
variable "slavekey_name" {
 default = "module"
}
 variable "slaveec2_instance_type" {
}
 variable "slave_name" {
}

