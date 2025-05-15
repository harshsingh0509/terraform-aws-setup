resource "aws_iam_role" "ec2_role" {
  name = "EC2-S3-Access"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

resource "aws_iam_policy" "s3_access" {
  name        = "EC2-S3-ReadOnly"
  description = "Allows EC2 to access S3"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": ["s3:GetObject", "s3:ListBucket"],
      "Resource": ["arn:aws:s3:::harsh-secure-bucket", "arn:aws:s3:::harsh-secure-bucket/*"]
    }
  ]
}
EOF
}

resource "aws_iam_instance_profile" "ec2_profile" {
  name = "EC2-S3-Profile"
  role = aws_iam_role.ec2_role.name
}

