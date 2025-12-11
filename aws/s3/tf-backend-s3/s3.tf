terraform {
  backend "s3" {
    bucket = "mybucket"
    key    = "path/to/my/key"
    region = "us-east-1"

    # optional:
    # whether to use a lockfile for locking the state file;
    # defaults to false;
    # must use it as enabling DynamoDB state locking is now deprecated;
    use_lockfile = true
  }
}
