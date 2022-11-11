# lambda function
#resource "aws_lambda_function" "send-error-to-slack" {
#  filename      = "./lambda_functions/send-error-to-slack/main.zip"
#  function_name = "send-error-to-slack"
#  role          = aws_iam_role.admin_role.arn
#  handler       = "lambda"
#  runtime       = "go1.x"
#}
