# Kali Instance Assume Role
resource "aws_iam_role" "kali-role" {
  name = "${var.kali_role_name}"

  
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })

  tags = {
    tag-key = "${var.kali_role_name}"
  }
}

# IAM Role Policy/Permission Definitions
resource "aws_iam_role_policy" "kali-role-policy" {
  name = "${var.kali_role_policy}"
  role = aws_iam_role.kali-role.id

  
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
      "Effect": "Allow",
      "Action": ["s3:ListBucket"],
      "Resource": ["arn:aws:s3:::<bucket-name>"]
    },
    {
      "Effect": "Allow",
      "Action": [
        "s3:PutObject",
        "s3:GetObject"
      ],
      "Resource": ["arn:aws:s3:::<bucket-name>/*"]
    }
    ]
  })
}

# Instance profile to be attached to the Kali Instance
resource "aws_iam_instance_profile" "kali-instance-profile" {
  name = "${var.kali_instance_policy}"
  role = aws_iam_role.kali-role.name
}

