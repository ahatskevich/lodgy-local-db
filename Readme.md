# Prerequesties

- install Docker https://docs.docker.com/desktop/setup/install/mac-install/
- install Make https://www.gnu.org/software/make/ (should be preinstalled on MacOS with Xcode)
- install AWS CLI https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html
- install Python3 https://www.python.org/downloads/
- install boto3: `pip3 install boto3`

# How to run

- configure AWS - run `aws configure` and provide your AWS credentials
  - AWS Access Key ID: local
  - AWS Secret Access Key: local
  - Default region name: us-west-2
  - Default output format: json
- `make dynamo` - build the docker image
- run or stop the docker container using Docker desktop or CLI
- run `python3 setup_dynamo.py` to establish connection and create/get record from orders table
