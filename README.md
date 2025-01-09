# Cost-Optimization-using-S3-bucket

The s3upload.sh script is designed to automate the storage of Jenkins Build logs using simple scripts which reads current date build logs from Jenkins and upload them directly into S3 Bucket wusing AWS CLI. The script outputs the log files based on number of jobs running in Jenkins and the same are reflecting in S3 bucket in AWS console.

# Goal : 
Provides 50% cost reduction by introducing a shell script which moves jenkins logs from ELK stacks to S3 bucket and made use of S3 lifecycle management by using Glacier and Deep Archive.

# Prerequisites
To run this script, ensure the following are installed and configured:

# 1. Install Jenkins 
* Follow the [Jenkins installation guide](https://www.jenkins.io/doc/book/installing/linux/) or copy below code to install jenkins in your AWS EC2 VM.
  ```     sudo wget -O /usr/share/keyrings/jenkins-keyring.asc \
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
# 4. Connect AWS CLI to your AWS Account
* Configure the AWS CLI with your credentials:
```
aws configure
```
  - Provide your **AWS Access Key ID.**
  - Provide your **AWS Secret Access Key.**
  - Specify your **Default region (e.g., us-east-1).**
  - Specify your **Default output format (e.g., json).**

# 5. Usage
Follow these steps to execute the script:
## 1. Make the Script Executable
* Grant execute permissions to the script:
```
chmod 777 s3upload.sh
```
## 2. Run the Script
* Execute the script to track and download log files
  ```
  ./s3upload.sh

## 3. Output
* The script upon successfull execution will upload the log files to S3 bucket with jobname & build number as the filename.

# Why S3 Bucket instead of ELK Stack ??
* S3 Glacier Deep Archive is a storage service optimized for low-cost, long-term archival.
* Features:
1. Optimized for extremely low-cost storage.
2. Retrieval takes hours (12–48 hours for bulk retrieval).
3. No real-time processing or querying capabilities.
4. Purpose: Primarily for cold storage and long-term data retention.

* ELK Stack is a real-time analytics platform used for log analysis, monitoring, and visualization.

# Notes
* Ensure you have created Jobs in your jenkins for the script to run without failure.
* Validate the log files saved in S3 bucket.
