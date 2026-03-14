# -----------------------------
# VPC Outputs
# -----------------------------

output "vpc_id" {
  description = "ID of the main VPC"
  value       = aws_vpc.main_vpc.id
}

output "public_subnet_1_id" {
  description = "ID of public subnet 1"
  value       = aws_subnet.public_subnet_1.id
}

output "public_subnet_2_id" {
  description = "ID of public subnet 2"
  value       = aws_subnet.public_subnet_2.id
}

output "private_subnet_1_id" {
  description = "ID of private subnet 1"
  value       = aws_subnet.private_subnet_1.id
}

output "private_subnet_2_id" {
  description = "ID of private subnet 2"
  value       = aws_subnet.private_subnet_2.id
}

# -----------------------------
# ALB Outputs
# -----------------------------

output "alb_arn" {
  description = "ARN of the Application Load Balancer"
  value       = aws_lb.app_alb.arn
}

output "alb_dns_name" {
  description = "Public DNS name of the Application Load Balancer"
  value       = aws_lb.app_alb.dns_name
}

output "target_group_arn" {
  description = "ARN of the target group"
  value       = aws_lb_target_group.app_tg.arn
}

# -----------------------------
# IAM Outputs
# -----------------------------

output "ec2_role_name" {
  description = "IAM role attached to EC2 instances"
  value       = aws_iam_role.ec2_role.name
}

output "instance_profile_name" {
  description = "IAM instance profile attached to EC2 instances"
  value       = aws_iam_instance_profile.ec2_instance_profile.name
}

# -----------------------------
# Auto Scaling Outputs
# -----------------------------

output "launch_template_id" {
  description = "ID of the launch template"
  value       = aws_launch_template.app_launch_template.id
}

output "autoscaling_group_name" {
  description = "Name of the Auto Scaling Group"
  value       = aws_autoscaling_group.app_asg.name
}

# -----------------------------
# NAT Gateway Output
# -----------------------------

output "nat_gateway_id" {
  description = "ID of the NAT Gateway"
  value       = aws_nat_gateway.nat_gateway.id
}
