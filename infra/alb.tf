resource "aws_lb" "alb" {
  name               = "ECS-Django-lb"
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb_sg.id]
  subnets            = [module.vpc.public_subnets]
}

resource "aws_lb_target_group" "grupo_alvo" {
  name        = "ECS-Django"
  port        = 8000
  protocol    = "HTTP"
  target_type = "ip"
  vpc_id      = module.vpc.vpc_id
}

resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.alb.arn
  port              = "8000"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.grupo_alvo.arn
  }
}

output "dns_name" {
  value = aws_lb.alb.dns_name
}
