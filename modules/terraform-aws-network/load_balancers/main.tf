resource "aws_elb" "elb" {
  availability_zones = var.availability_zones

  dynamic "listener" {
    for_each = {
      for idx, rule in var.elb_listeners : "${rule.instance_port}-${rule.instance_protocol}-${rule.lb_port}-${rule.lb_protocol}" => rule
    }

    content {
      instance_port     = listener.value.instance_port
      instance_protocol = listner.value.instance_protocol
      lb_port           = listener.value.lb_port
      lb_protocol       = listener.value.lb_protocol
    }
  }

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "HTTP:8000/"
    interval            = 30
  }
}
