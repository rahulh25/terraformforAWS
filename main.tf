resource "aws_instance" "covid19-data-instance" {
  ami             = "ami-0dc34a024759117e0"
  instance_type   = "t2.micro"
  security_groups = ["covid-dashboard"]
  key_name = "coviddashboard"
  user_data = <<-EOF
      #!/bin/bash
      sudo docker pull rahulh25/covid19-dashboard:3.0
      sudo docker run --name test --rm -d -i -t -p 5000:80 rahulh25/covid19-dashboard:5.0
	EOF
  tags = {
    Name = "covid-dashboard-instance"
  }
}