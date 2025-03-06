
### outputs.tf

output "alb_dns_name" {
  description = "The Load Balancer URL"
  value       = aws_lb.alb.dns_name
}

