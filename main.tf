####### ECR Repository ##########

resource "aws_ecr_repository" "ecr_repo" {
  name                 = var.ECR_REPOSITORY
}

####### ECS Cluster ##########

resource "aws_ecs_cluster" "sample_cluster" {
  name = var.ECS_CLUSTER 
  setting {
    name  = "containerInsights"
    value = "enabled"
  }
}

###### Task Role #######

resource "aws_iam_role" "task_role_name" {
  name = "${var.TASK_ROLE_NAME}"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        "Sid" : "",
        "Effect" : "Allow",
        "Principal" : {
          "Service" : "ecs-tasks.amazonaws.com"
        },
        "Action": "sts:AssumeRole"
      }
    ]
  })
}

variable "iam_policy_arns" {
  default = ["arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy", "arn:aws:iam::aws:policy/SecretsManagerReadWrite",
"arn:aws:iam::aws:policy/CloudWatchFullAccess", "arn:aws:iam::aws:policy/AmazonS3FullAccess", "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly",
"arn:aws:iam::aws:policy/AmazonECS_FullAccess"]
}

resource "aws_iam_role_policy_attachment" "task_role_policy_attach" {
  role = "${aws_iam_role.task_role_name.name}"
  count      = "${length(var.iam_policy_arns)}"
  policy_arn = "${var.iam_policy_arns[count.index]}"
}


############# Task Definition ################

resource "aws_ecs_task_definition" "task_definition" {
  family                   = var.TASK_DEFINITION_NAME
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  cpu                      = 256
  memory                   = 512
  task_role_arn            = "${aws_iam_role.task_role_name.arn}"
  execution_role_arn       = "${aws_iam_role.task_role_name.arn}"
  container_definitions    = <<TASK_DEFINITION
[
  {
    "name": "${var.CONTAINER_NAME}",
    "image": "${var.DOCKER_IMAGE}",
    "cpu": 256,
    "memory": 512,
    "essential": true,
    "environment": [
      {"name": "${var.VARNAME1}", "value": "${var.VARVAL1}"},
      {"name": "${var.VARNAME2}", "value": "${var.VARVAL2}"},
      {"name": "${var.VARNAME3}", "value": "${var.VARVAL3}"},
      {"name": "${var.VARNAME4}", "value": "${var.VARVAL4}"},
      {"name": "${var.VARNAME5}", "value": "${var.VARVAL5}"}
    ],
    "portMappings": [
      {
        "containerPort": ${var.PORT_NUMBER}
      }
    ]
  }
]
TASK_DEFINITION

  runtime_platform {
    operating_system_family = "LINUX"
  }
}


########### Security Group of LB and ECS #############

resource "aws_security_group" "security_group_LB" {
  name        = var.SECURITY_GROUP_LB
  description = "Allow SSL inbound traffic"
  vpc_id      = var.VPC_ID
  tags = {
    Name = "${var.SECURITY_GROUP_LB}"
  }

  ingress {
    description      = "SSL from VPC"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "security_group_ecs" {
  name        = var.SECURITY_GROUP_ECS
  description = "Allow TCP inbound traffic from LB"
  vpc_id      = var.VPC_ID
  tags = {
    Name = "${var.SECURITY_GROUP_ECS}"
}

  ingress {
    from_port        = 0
    to_port          = 65535
   protocol         = "tcp"
    security_groups      = ["${aws_security_group.security_group_LB.id}"]
  }

  ingress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    self 	     = true
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }
}

########### Load Balancer ###############

resource "aws_lb" "ecs_load_balancer" {
  name               = var.LB_NAME
  load_balancer_type = "application"
  internal           = false
  security_groups    = [aws_security_group.security_group_LB.id]
  subnets            = [var.SUBNET1, var.SUBNET2]
  ip_address_type    = "ipv4"
  tags = {
    Name = "${var.LB_NAME}"
  }
}

########### Target Group ################

resource "aws_lb_target_group" "ecs_target_group" {
  name     = var.TARGET_GROUP
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.VPC_ID
  target_type = "instance"
  protocol_version = "HTTP1"
  health_check {
    path = var.HEALTH_CHECK_PATH
  }
}
############# Load Balancer Listener ###############

resource "aws_lb_listener" "ecs_lb_listener" {
  load_balancer_arn = aws_lb.ecs_load_balancer.arn
  port              = "443"
  protocol          = "HTTPS"
  ssl_policy        = var.SECURITY_POLICY
  certificate_arn   = var.CERTIFICATE_ARN
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.ecs_target_group.arn
  }
}

############ resource "aws_route53_record" "ecs_route_53" {
  zone_id = var.ZONE_ID
  name    = var.RECORD_NAME
  type    = "A"
  alias {
  name                   = aws_lb.ecs_load_balancer.dns_name
  zone_id                = aws_lb.ecs_load_balancer.zone_id
  evaluate_target_health = true
  }
}
