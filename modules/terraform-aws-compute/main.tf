resource "aws_instance" "instances" {
  for_each = var.security_group_ids

  instance_type = "t3.micro"

  availability_zone = var.availability_zone
  ami               = var.ami_id

  key_name                    = var.key_name
  associate_public_ip_address = each.key == "public" ? true : false
  vpc_security_group_ids      = [each.value]
  subnet_id                   = var.subnet_ids[each.key]

  root_block_device {
    volume_size = 8
  }

  tags = {
    name = each.key
  }
}
