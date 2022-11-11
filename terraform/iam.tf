resource "aws_iam_role" "admin_role" {
  name               = "admin-role"
  assume_role_policy = <<EOF
{
	"Version": "2012-10-17",
	"Statement": [
		{
			"Action": "sts:AssumeRole",
			"Principal": {
				"Service": "lambda.amazonaws.com"
			},
			"Effect": "Allow",
			"Sid": ""
		}
	]
}
EOF
}

resource "aws_iam_policy" "admin_policy" {
  name   = "admin-iam-policy"
  policy = data.aws_iam_policy_document.admin_policy_document.json
}

resource "aws_iam_role_policy_attachment" "admin_poilcy_attachment" {
  role       = aws_iam_role.admin_role.name
  policy_arn = aws_iam_policy.admin_policy.arn
}

data "aws_iam_policy_document" "admin_policy_document" {
  statement {
    effect = "Allow"
    actions = [
      "s3:GetObject",
      "s3:ListBucket",
      "s3:PutBucketNotification",
      "s3:PutObject",
      "s3:DeleteObject",
    ]
    resources = ["*"]
  }
  statement {
    effect = "Allow"
    actions = [
      "kinesis:DescribeStream",
      "kinesis:GetShardIterator",
      "kinesis:GetRecords"
    ]
    resources = ["*"]
  }
}
