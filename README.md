# Cost-Optimization-using-S3-bucket

The s3upload.sh script is designed to automate the storage of Jenkins Build logs using simple scripts which reads current date build logs from Jenkins and upload them directly into S3 Bucket wusing AWS CLI. The script outputs the log files based on number of jobs running in Jenkins and the same are reflecting in S3 bucket in AWS console.

# Prerequisites
To run this script, ensure the following are installed and configured:

# 1. Install Jenkins 
* Follow the Jenkins [installation guide](https://www.jenkins.io/doc/book/installing/linux/) or copy below code to install jenkins in your AWS EC2 VM.
  ```
  	  sudo wget -O /usr/share/keyrings/jenkins-keyring.asc \
	  https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key
	  echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc]" \
	  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
	  /etc/apt/sources.list.d/jenkins.list > /dev/null
	  sudo apt-get update
          sudo apt-get install jenkins -y

# 2. Install Java jdk17
  ```
    sudo apt install openjdk-17-jre-headless -y
  ```
# 3. Install AWS CLI
* Follow the [AWS CLI installation guide](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html) to install the AWS Command Line Interface (CLI).
* Verify the installation using:
  ```
   aws --version
  ```
# 2. Connect AWS CLI to Your AWS Account
* Configure the AWS CLI with your credentials:
```
aws configure
```
  - Provide your AWS Access Key ID.
  - Provide your AWS Secret Access Key.
  - Specify your Default region (e.g., us-east-1).
  - Specify your Default output format (e.g., json).

