include_recipe 's3_dir::default'

s3_dir '/tmp/s3_dir_test' do
  bucket 's3dir-test-bucket'
  dir '/s3_dir_test'
  access_key_id node['s3_dir']['aws_access_key_id']
  secret_access_key node['s3_dir']['aws_secret_access_key']
  action :create
end
