### autoscaling.tf

resource "aws_launch_template" "web_lt" {
  name_prefix   = "web-lt-"
  image_id      = data.aws_ami.this.id
  instance_type = "t2.micro"

  iam_instance_profile {
    name = aws_iam_instance_profile.web_instance_profile.name
  }

  security_group_names = [aws_security_group.sg_web.name]
}

resource "aws_autoscaling_group" "web_asg" {
  vpc_zone_identifier = [aws_subnet.sn_public_a.id, aws_subnet.sn_public_b.id, aws_subnet.sn_public_c.id]
  desired_capacity    = var.web_asg_desired
  max_size            = var.web_asg_max
  min_size            = var.web_asg_min

  launch_template {
    id      = aws_launch_template.web_lt.id
    version = "$Latest"
  }
}