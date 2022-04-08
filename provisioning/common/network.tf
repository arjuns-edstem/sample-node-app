resource "aws_default_vpc" "sample-node-app-vpc" {
  tags = {
    Name = "Default VPC"
  }
}

resource "aws_route" "internet_access" {
    route_table_id = "${aws_default_vpc.sample-node-app-vpc.main_route_table_id}"
    destination_cidr_block = "0.0.0.0/0"
    gateway_id = "igw-05c6d57d"
}

resource "aws_security_group" "security_group_example_app" {
    name = "security_group_example_app"
    description = "Allow TLS inbound traffic on port 80 (http)"
    vpc_id = "${aws_default_vpc.sample-node-app-vpc.id}"

    ingress {
        from_port = 80
        to_port = 3000
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}