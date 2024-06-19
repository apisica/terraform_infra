variable "instance_specs" {
  type = list(object({
    size = string
    name = string
  }))
}

resource "aws_instance" "instance" {
  for_each = { for idx, instance in var.instance_specs : idx => instance }

  ami           = "ami-0c55b159cbfafe1f0"  # Example AMI, replace with actual
  instance_type = each.value.size
  tags = {
    Name = each.value.name
  }
}
