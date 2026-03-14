# -----------------------------
# Launch Template
# -----------------------------

resource "aws_launch_template" "app_launch_template" {
  name_prefix   = "${var.project_name}-lt-"
  image_id      = var.ami_id
  instance_type = var.instance_type

  vpc_security_group_ids = [
    aws_security_group.app_sg.id
  ]

  iam_instance_profile {
    name = aws_iam_instance_profile.ec2_instance_profile.name
  }

  user_data = filebase64("../scripts/user_data.sh")

  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = "AppServer"
    }
  }

  tags = {
    Name = "${var.project_name}-launch-template"
  }
}

# -----------------------------
# Auto Scaling Group
# -----------------------------

resource "aws_autoscaling_group" "app_asg" {
  name             = "${var.project_name}-asg"
  min_size         = var.asg_min_size
  max_size         = var.asg_max_size
  desired_capacity = var.asg_desired_capacity
  vpc_zone_identifier = [
    aws_subnet.private_subnet_1.id,
    aws_subnet.private_subnet_2.id
  ]

  target_group_arns = [
    aws_lb_target_group.app_tg.arn
  ]

  launch_template {
    id      = aws_launch_template.app_launch_template.id
    version = "$Latest"
  }

  health_check_type         = "ELB"
  health_check_grace_period = 300

  tag {
    key                 = "Name"
    value               = "AppServer"
    propagate_at_launch = true
  }

  lifecycle {
    create_before_destroy = true
  }
}
