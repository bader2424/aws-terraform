resource "aws_lb" "app_alb" {
  name               = "${var.environment}-alb"
  internal           = false
  load_balancer_type = "application"
  subnets            = var.public_subnet_ids

  tags = {
    Name = "${var.environment}-alb"
    Env  = var.environment
  }
}

resource "aws_lb_target_group" "tg" {
  name     = "${var.environment}-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id
}

resource "aws_lb_target_group_attachment" "tg_attach" {
  count = length(var.target_instance_ids)
  
  target_group_arn = aws_lb_target_group.tg.arn
  target_id        = var.target_instance_ids[count.index]
  port             = 80
}


resource "aws_lb_listener" "listener" {
  load_balancer_arn = aws_lb.app_alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg.arn
  }
}
