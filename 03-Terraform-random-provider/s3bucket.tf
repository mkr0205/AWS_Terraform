resource "random_pet" "petname" {
  length = 5
  separator = "-"
}

resource "aws_s3_bucket" "tfs3" {
  bucket = random_pet.petname.id
  tags = {
    Name = "my Bucket"
    Environment = "Dev"
  }
}