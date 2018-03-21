###
### ECS Services & tasks
###

resource "aws_ecs_task_definition" "myapp1" {
  family                = "myapp1"
  container_definitions = <<DEFINITION
[{
  "name": "myapp1",
  "image": "${var.myapp1_image}",
  "cpu": 40,
  "memory": 128,
  "network_mode": "host",
  "essential": true,
  "portMappings": [{
    "containerPort": 8080,
    "hostPort": 8080
  }]
}]
DEFINITION
}


resource "aws_ecs_service" "myapp1" {
  name            = "myapp1"
  cluster         = "${aws_ecs_cluster.ecs_cluster1.id}"
  task_definition = "${aws_ecs_task_definition.myapp1.arn}"
  desired_count   = 2
}