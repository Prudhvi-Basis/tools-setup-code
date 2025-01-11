data "aws_ami" "ami" {
  most_recent = true
  name_regex  = "Rhel-Golden-Image"
  owners = ["self"]
}