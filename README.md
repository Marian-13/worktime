# Local setup

1. Install [Java](https://github.com/shyiko/jabba)

```
$ jabba install 1.8
$ jabba alias default 1.8
```

2. Install [DynamoDB](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/DynamoDBLocal.DownloadingAndRunning.html)

In `.profile`
```
alias dynamodb='java -Djava.library.path=/home/marian/DynamoDB/DynamoDBLocal_lib -jar /home/marian/DynamoDB/DynamoDBLocal.jar -sharedDb'
```

```
$ dynamodb
```

3. Install [Python](https://github.com/pyenv/pyenv)

```
$ sudo apt-get install -y make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev
$ pyenv install 3.7.2
$ pyenv global 3.7.2
```

4. Install [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-install.html)

```
$ pip install awscli --upgrade --user
$ aws --version
```

5. Install [Ruby AWS SDK](https://github.com/aws/aws-sdk-ruby)

In `Gemfile`

```
gem 'aws-sdk', '~> 3'
# gem 'aws-sdk-dynamodb'
```

```
$ bundle install
```

[Ruby and DynamoDB Tutorials](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/GettingStarted.Ruby.html)
