resource "aws_lambda_function" "send-error-to-slack" {
  filename         = data.archive_file.send_error_to_slack.output_path
  function_name    = "send_error_to_slack"
  role             = aws_iam_role.admin_role.arn
  handler          = "index.handler"
  timeout          = 30
  source_code_hash = data.archive_file.send_error_to_slack.output_base64sha256
  runtime          = "go1.x"
}

data "archive_file" "send_error_to_slack" {
  type        = "zip"
  output_path = "${path.module}/lambda_functions/send_error_to_slack/main.zip"
  source_file = "${path.module}/lambda_functions/send_error_to_slack/main"
}
