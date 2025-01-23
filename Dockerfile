FROM amazonlinux:2

RUN yum update -y && yum install -y \
    curl \
    tar \
    unzip \
    java-1.8.0-openjdk \
    python3 \
    && curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" \
    && unzip awscliv2.zip \
    && ./aws/install \
    && rm -rf awscliv2.zip ./aws \
    && yum clean all

WORKDIR /dynamodb_local
RUN curl -L "https://s3.us-west-2.amazonaws.com/dynamodb-local/dynamodb_local_latest.tar.gz" -o "dynamodb_local_latest.tar.gz" \
    && tar -xvzf dynamodb_local_latest.tar.gz \
    && rm -rf dynamodb_local_latest.tar.gz

COPY start.sh /usr/local/bin/start.sh

RUN chmod +x /usr/local/bin/start.sh

# Устанавливаем скрипт start.sh как команду по умолчанию
CMD ["/usr/local/bin/start.sh"]
