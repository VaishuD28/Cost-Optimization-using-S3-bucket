# Cost-Optimization-using-S3-bucket

The s3upload.sh script is designed to automate the storage of Jenkins Build logs using simple scripts which reads current date build logs from Jenkins and upload them directly into S3 Bucket wusing AWS CLI. The script outputs the log files based on number of jobs running in Jenkins and the same are reflecting in S3 bucket in AWS console.

# Prerequisites
To run this script, ensure the following are installed and configured:

# Install AWS CLI
Follow the [AWS CLI installation guide](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html) to install the AWS Command Line Interface (CLI).
Verify the installation using:
