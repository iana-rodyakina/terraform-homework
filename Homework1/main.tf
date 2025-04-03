resource "aws_iam_user" "blackpink_users" {
  for_each = toset(["jenny", "rose", "lisa", "jisoo"])
  name     = each.value
}

resource "aws_iam_user" "twice_users" {
  for_each = toset(["jihyo", "sana", "momo", "dahyun"])
  name     = each.value
}

resource "aws_iam_group" "blackpink" {
  name = "blackpink"
}

resource "aws_iam_group" "twice" {
  name = "twice"
}

resource "aws_iam_group_membership" "blackpink_team" {
  name = "blackpink-team"
  users = [
    for user in aws_iam_user.blackpink_users : user.name
  ]
  group = aws_iam_group.blackpink.name
}

resource "aws_iam_group_membership" "twice_team" {
  name = "twice-team"
  users = [
    for user in aws_iam_user.twice_users : user.name
  ]
  group = aws_iam_group.twice.name
}

# terraform import aws_iam_user.miyeon miyeon
# terraform import aws_iam_user.mina mina

resource "aws_iam_user" "miyeon" {
  name = "miyeon"
}

resource "aws_iam_user" "mina" {
  name = "mina"
}

resource "aws_iam_group_membership" "miyeon_group" {
  name  = "miyeon-team"
  users = [aws_iam_user.miyeon.name]
  group = aws_iam_group.blackpink.name
}

resource "aws_iam_group_membership" "mina_group" {
  name  = "mina-team"
  users = [aws_iam_user.mina.name]
  group = aws_iam_group.twice.name
}