###
### Key Pair
###
resource "aws_key_pair" "ssh_key" {
  key_name   = "myapp-ssh-key"
  public_key = "${file("secrets/myapp.pub")}"
}
