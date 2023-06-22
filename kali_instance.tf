data "aws_ami" "official-kali" {
    most_recent = true
    owners = ["aws-marketplace"]

    filter {
        name = "name"
        values = ["kali-last-snapshot-amd64-2023.*"]
    }

    filter {
        name = "virtualization-type"
        values = ["hvm"]
    }
}

# Generate key pair with $ ssh-keygen -t kali_key at the specified path
resource "aws_key_pair" "kali_key" {
    key_name = "${var.key_name}"
    public_key = file(var.PATH_TO_PUBLIC_KEY)
}

# The Kali EC2 Instance 
resource "aws_instance" "kali-linux" {
    ami = data.aws_ami.official-kali.id
    instance_type = "${var.instance_type}"
    availability_zone = data.aws_availability_zones.available.names[1]
    key_name = aws_key_pair.kali_key.key_name 
    iam_instance_profile = aws_iam_instance_profile.kali-instance-profile.name
    vpc_security_group_ids = [aws_security_group.kali-sg.id]
    root_block_device {
    volume_size           = "${var.volume_size}"
    volume_type           = "${var.volume_type}"
    delete_on_termination = var.delete_on_termination
  }

    tags = {
        Name = "${var.instance_name}"
    }

    provisioner "file" {
        source = "kaliconf.sh"
        destination = "/tmp/kaliconf.sh"
    }

    provisioner "remote-exec" {
        inline = [
            "chmod +x /tmp/kaliconf.sh",
            "sudo sed -i -e 's/\r$//' /tmp/kaliconf.sh",
            "sudo /tmp/kaliconf.sh",
        ]
    }

    connection {
        host = coalesce(self.public_ip, self.private_ip)
        type = "ssh"
        user = "kali"
        private_key = file(var.PATH_TO_PRIVATE_KEY)
    }
}







