### alb.tf

resource "aws_lb" "alb" {
  name               = "ALB"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.sg_load_balancer.id]
  subnets            = [aws_subnet.sn_public_a.id, aws_subnet.sn_public_b.id, aws_subnet.sn_public_c.id]
}

resource "aws_lb_target_group" "alb_tg" {
  name     = "ALB-TG"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.vpc1.id
}
