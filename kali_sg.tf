
# In Security Group, allow udp 4789 for the traffic mirror
resource "aws_security_group" "kali-sg" {
  tags = {
    Name = "${var.kali_sg_name}"
 
  }

  name = "${var.kali_sg_name}"
  description = "Kali Security Group"
 # vpc_id      = var.vpc_id 

  dynamic "ingress" {
    for_each = var.kali_ports
    content {
        from_port = ingress.value
        to_port = ingress.value
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
  }

    ingress {
    from_port   = 4789
    to_port     = 4789
    protocol    = "udp"
    cidr_blocks = ["0.0.0.0/0"]
  }

    ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["${var.mirror_source_ip}"]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


