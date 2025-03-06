### iam.tf

resource "aws_iam_role" "web_role" {
  name = "WEBRole"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect = "Allow"
      Principal = {
        Service = "ec2.amazonaws.com"
      }
      Action = "sts:AssumeRole"
    }]
  })
}

resource "aws_iam_role_policy" "web_role_policy" {
  name = "WEBRolePolicy"
  role = aws_iam_role.web_role.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "ec2:Describe*",
          "s3:ListBucket",
          "s3:GetObject"
        ]
        Resource = "*"
      }
    ]
  })
}

resource "aws_iam_instance_profile" "web_instance_profile" {
  name = "WEBInstanceProfile"
  role = aws_iam_role.web_role.name
}