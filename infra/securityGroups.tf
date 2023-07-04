resource "aws_security_group" "alb_sg" { # alb = application load balancer
  name   = "alb-ECS"
  vpc_id = module.vpc.vpc_id
}

resource "aws_security_group_rule" "entrada_alb" {
  type              = "ingress"
  from_port         = 8000
  to_port           = 8000
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"] # libera acesso para qualquer ip
  security_group_id = aws_security_group.alb_sg.id
}

resource "aws_security_group_rule" "saida_alb" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"          # libera acesso para qualquer protocolo
  cidr_blocks       = ["0.0.0.0/0"] # libera acesso para qualquer ip
  security_group_id = aws_security_group.alb_sg.id
}

resource "aws_security_group" "privado" { # alb = application load balancer
  name   = "privado-ECS"
  vpc_id = module.vpc.vpc_id
}

resource "aws_security_group_rule" "entrada_ecs" {
  type                     = "ingress"
  from_port                = 0
  to_port                  = 0
  protocol                 = "-1"
  source_security_group_id = aws_security_group.alb_sg.id #libera acesso para o security group do alb
  security_group_id        = aws_security_group.privado.id
}

resource "aws_security_group_rule" "saida_ecs" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.privado.id
}
