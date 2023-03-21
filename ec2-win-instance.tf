resource "aws_instance" "win_server" {
  ami           = data.aws_ami.windows_2019.id
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.public_subnet.id
  key_name = ""

  #  # Windows-specific settings
  #  user_data = <<-EOF
  #    <powershell>
  #      # Install IIS and configure a default website
  #      Install-WindowsFeature Web-Server
  #      New-Item -ItemType Directory -Path C:\inetpub\wwwroot -Force
  #      Set-Content -Path C:\inetpub\wwwroot\Default.htm -Value "<h1>Hello, World!</h1>"
  #      Restart-Service W3SVC
  #    </powershell>
  #    EOF

  # root disk
  root_block_device {
    volume_size           = var.win_root_volume_size
    volume_type           = var.win_root_volume_type
    delete_on_termination = true
    encrypted             = true
  }
  # extra disk
  ebs_block_device {
    device_name           = "/dev/xvda"
    volume_size           = var.win_data_volume_size
    volume_type           = var.win_data_volume_type
    encrypted             = true
    delete_on_termination = true
  }

  # Tags for the instance
  tags = {
    Name = var.win_instance_name
  }
}