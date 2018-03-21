###
### ECS Cluster & Cluster instances
###
resource "aws_ecs_cluster" "ecs_cluster1" {
  name = "cluster1"
}


resource "aws_launch_configuration" "ecs" {
  name                 = "ecs"
  image_id             = "${lookup(var.amis, var.region)}"
  instance_type        = "t2.micro"
  key_name             = "${aws_key_pair.ssh_key.key_name}"
  iam_instance_profile = "${aws_iam_instance_profile.ecs-instance-profile.id}"
  
  security_groups      = [
    "${aws_security_group.sc_all.id}"
    ]

  user_data            = "${data.template_file.user_data.rendered}"

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_group" "ecs" {
  name                 = "ecs-asg"
  launch_configuration = "${aws_launch_configuration.ecs.name}"
  vpc_zone_identifier  = [
    "${aws_subnet.subnet1.id}",
    "${aws_subnet.subnet2.id}"
    ]
  min_size             = 2
  max_size             = 3
  desired_capacity     = 2
}


# user_data template
data "template_file" "user_data" {
  template = "${file("templates/user_data.sh.tpl")}"

  vars {
    cluster_name = "${aws_ecs_cluster.ecs_cluster1.name}"
  }
}
