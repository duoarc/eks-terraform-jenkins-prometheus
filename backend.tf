terraform {
  backend "s3" {
    bucket = "altschoolexamsem3"
    region = "eu-west-2"
    key = "jenkins-kp/terraform.tfstate"
  }
}