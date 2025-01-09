#!/bin/bash

JENKINS_HOME="/var/lib/jenkins"  # Replace with your Jenkins home directory
S3_BUCKET="s3://jenkins-costoptimization"   # Replace with your S3 bucket name
DATE=$(date +%Y-%m-%d) #prints current date
#check if AWS CLI is installed
if ! command -v aws &> /dev/null; then
        echo "AWS CLI is not installed. Please install to proceed."
        exit 1
fi
# Iterate through all job directories
for job_dir in "$JENKINS_HOME/jobs/"*/; do
        job_name=$(basename "$job_dir")

        # Iterate through build logs for the jobs
        for build_log in "$job_dir/builds/"*/; do
                #Get build number and log file path
                build_number=$(basename "$build_log")
                log_file="$build_log/log"

                #Check if log files exists and was created today(date)
                if [ -f "$log_file" ] && [ "$(date -r "$log_file" +%Y-%m-%d)" == "$DATE" ]; then
                        # Upload the log file to S3 with jobname &  build number as  the filename
                        aws s3 cp "$log_file" "$S3_BUCKET/$job_name-$build_number.log" --only-show-errors

                        # if script is successful the uploaded meassage is printed
                        if [ $? -eq 0 ]; then
                                echo "Uploaded succesfully : $job_name/$build_number to $S3_BUCKET/$job_name-$build_number.log"
                        else
                                echo "Failed to upload : $job_name/$build_number"
                        fi
                fi
        done
done
