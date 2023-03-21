# Windows Server 2022
data "aws_ami" "windows_2022" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "name"
    values = ["Windows_Server-2022-English-Full-Base*"]
  }
}

# Windows Server 2019
data "aws_ami" "windows_2019" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "name"
    values = ["Windows_Server-2019-English-Full-Base*"]
  }
}

# Windows Server 2016
data "aws_ami" "windows_2016" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "name"
    values = ["Windows_Server-2016-English-Full-Base*"]
  }
}