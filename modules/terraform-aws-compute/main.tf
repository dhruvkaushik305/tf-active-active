resource "aws_instance" "instances" {
  for_each = var.network_interface_ids

  instance_type = "t2.micro"

  availability_zone = var.availability_zone
  ami               = var.ami_id

  key_name = "debian-12"
  root_block_device {
    volume_size = 8
  }

  network_interface {
    network_interface_id = each.value
    device_index         = 0
  }
}
