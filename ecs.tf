#data "aws_iam_policy_document" "ecs_tasks_execution_role" {
#  statement {
#    actions = ["sts:AssumeRole"]
#
#    principals {
#      type        = "Service"
#      identifiers = ["ecs-tasks.amazonaws.com"]
#    }
#  }
#}

#resource "aws_iam_role" "ecs_tasks_execution_role" {
#  name               = "ecsTaskExecutionRole"
#  assume_role_policy = "${data.aws_iam_policy_document.ecs_tasks_execution_role.json}"
#}
#
#resource "aws_iam_role_policy_attachment" "ecs_tasks_execution_role" {
#  role       = "${aws_iam_role.ecs_tasks_execution_role.name}"
#  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
#}
#
#resource "aws_ecs_task_definition" "ecstaskDefinition" {
#  family                = "pocFamily"
#  container_definitions = file("taskdef.json")
#  execution_role_arn = "${aws_iam_role.ecs_tasks_execution_role.arn}"
#  requires_compatibilities = ["FARGATE"]
#  network_mode = "awsvpc"
#  cpu = 10
#  memory = 128
#}
#resource "aws_ecs_service" "ecsService" {
#  name            = "pocService"
#  cluster         = "arn:aws:ecs:us-east-1:854889429362:cluster/pocCluster"
#  task_definition = "pocFamily"
#  desired_count   = 1
#  launch_type = "FARGATE"
#
#   deployment_controller {
#    type = "CODE_DEPLOY"
#  }
#
#  load_balancer {
#    target_group_arn = "arn:aws:elasticloadbalancing:us-east-1:854889429362:targetgroup/target-group-1/00fe198787fe9b88"
#    container_name   = "pocApp"
#    container_port   = 80
#  }
#
#}