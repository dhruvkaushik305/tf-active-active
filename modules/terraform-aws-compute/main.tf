resource "aws_instance" "instances" {
  for_each = var.network_interface_ids

  instance_type = "t3.micro"

  availability_zone = var.availability_zone
  ami               = var.ami_id

  key_name = var.key_name

  root_block_device {
    volume_size = 8
  }

  tags = {
    name = each.key
  }
  network_interface {
    network_interface_id = each.value
    device_index         = 0
  }
}

resource "aws_eip_association" "eip_assoc" {
  instance_id   = aws_instance.instances["public"].id
  allocation_id = var.allocation_id
}
