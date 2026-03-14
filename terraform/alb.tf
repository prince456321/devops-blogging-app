# -----------------------------
# Application Load Balancer
# -----------------------------

resource "aws_lb" "app_alb" {
  name               = "${var.project_name}-alb"
  internal           = false
  load_balancer_type = "application"

  security_groups = [aws_security_group.alb_sg.id]

  subnets = [
    aws_subnet.public_subnet_1.id,
    aws_subnet.public_subnet_2.id
  ]

  tags = {
    Name = "${var.project_name}-alb"
  }
}

# -----------------------------
# Target Group
# -----------------------------

resource "aws_lb_target_group" "app_tg" {
  name        = "${var.project_name}-tg"
  port        = var.app_port
  protocol    = "HTTP"
  target_type = "instance"
  vpc_id      = aws_vpc.main_vpc.id

  health_check {
    enabled             = true
    path                = "/login"
    port                = "traffic-port"
    protocol            = "HTTP"
    matcher             = "200"
    healthy_threshold   = 3
    unhealthy_threshold = 3
    interval            = 30
    timeout             = 5
  }

  tags = {
    Name = "${var.project_name}-tg"
  }
}

# -----------------------------
# Listener
# -----------------------------

resource "aws_lb_listener" "http_listener" {
  load_balancer_arn = aws_lb.app_alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.app_tg.arn
  }
}
