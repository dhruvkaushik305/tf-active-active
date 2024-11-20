resource "aws_instance" "instances" {
  for_each = var.network_interface_ids

  instance_type     = "t2.micro"
  availability_zone = var.az
  ami               = var.ami_id

  root_block_device {
    volume_size = 8
  }

  network_interface {
    network_interface_id = each.value
    device_index         = 0
  }
}
