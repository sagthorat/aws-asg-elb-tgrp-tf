### variables.tf

variable "tfc_aws_dynamic_credentials" {
  description = "Object containing AWS dynamic credentials configuration"
  type = object({
    default = object({
      shared_config_file = string
    })
    aliases = map(object({
      shared_config_file = string
    }))
  })
}

variable "web_asg_max" {
  description = "Specifies the maximum number of EC2 instances in the Web Autoscaling Group."
  default     = 10
}

variable "web_asg_min" {
  description = "Specifies the minimum number of EC2 instances in the Web Autoscaling Group."
  default     = 0
}

variable "web_asg_desired" {
  description = "Specifies the Desired number of EC2 instances in the Web Autoscaling Group."
  default     = 6
}
