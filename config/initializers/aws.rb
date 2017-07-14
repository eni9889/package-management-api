aws_config = YAML.load_file('config/aws.yml')[Rails.env]
Aws.config[:credentials] = Aws::Credentials.new(aws_config['access_key_id'], aws_config['secret_access_key'])
Aws.config[:region] = 'us-east-1'