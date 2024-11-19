resource "aws_instance" "bastion_host" {
  instance_type     = "t2.micro"
  availability_zone = var.az
  ami               = "ami-03c68e52484d7488f"

  root_block_device {
    volume_size = 8
  }

  network_interface {
    network_interface_id = var.net_public_id
    device_index         = 0
  }
}

resource "aws_instance" "bastion_host" {
  instance_type     = "t2.micro"
  availability_zone = var.az
  ami               = "ami-03c68e52484d7488f"

  root_block_device {
    volume_size = 8
  }

  network_interface {
    network_interface_id = var.net_web_id
    device_index         = 0
  }
}

resource "aws_instance" "bastion_host" {
  instance_type     = "t2.micro"
  availability_zone = var.az
  ami               = "ami-03c68e52484d7488f"

  root_block_device {
    volume_size = 8
  }

  network_interface {
    network_interface_id = var.net_app_id
    device_index         = 0
  }
}
