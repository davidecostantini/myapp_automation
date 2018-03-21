resource "aws_autoscaling_attachment" "asg_attachment_bar" {
  autoscaling_group_name = "${aws_autoscaling_group.ecs.id}"
  elb                    = "${aws_elb.elb1.id}"
}

resource "aws_elb" "elb1" {
  name               = "elb1"
  subnets 			 = [
    "${aws_subnet.subnet3.id}",
    "${aws_subnet.subnet4.id}"
    ]

  listener {
    instance_port     = 8080
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "HTTP:8080/"
    interval            = 10
  }

  security_groups       = [
    "${aws_security_group.sc_tcp_80.id}"
    ]

  cross_zone_load_balancing   = true
  idle_timeout                = 400
  connection_draining         = true
  connection_draining_timeout = 400

}


output "endpoint" {
  value = "${aws_elb.elb1.dns_name}"
}