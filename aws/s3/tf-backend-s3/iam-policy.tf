resource "aws_iam_user_policy" "s3_backend" {
    name = "S3ListOnlyPolicy"
    # link to AWS IAM identity
    user = aws_iam_user.abc.name
    policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": "s3:ListBucket",
      "Resource": "arn:aws:s3:::mybucket",
      "Condition": {
        "StringEquals": {
          "s3:prefix": "mybucket/path/to/my/key"
        }
      }
    },
    {
      "Effect": "Allow",
      "Action": ["s3:GetObject", "s3:PutObject"],
      "Resource": [
        "arn:aws:s3:::mybucket/path/to/my/key"
      ]
    },
    {
      "Effect": "Allow",
      "Action": ["s3:GetObject", "s3:PutObject", "s3:DeleteObject"],
      "Resource": [
        "arn:aws:s3:::mybucket/path/to/my/key.tflock"
      ]
    }
  ]
}
 EOF

}
