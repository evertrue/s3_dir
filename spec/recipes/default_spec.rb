require 'spec_helper'

describe 's3_dir_test::default' do
  let(:chef_run) do
    ChefSpec::ServerRunner.new do |node|
      node.override['s3_dir']['aws_access_key_id']     = 'TEST_KEY'
      node.override['s3_dir']['aws_secret_access_key'] = 'TEST_SECRET'
    end.converge described_recipe
  end

  it 'updates apt' do
    expect(chef_run).to update_apt_update 'apt'
  end

  it 'includes the `et_fog::default` recipe' do
    expect(chef_run).to include_recipe 'et_fog::default'
  end

  it 'downloads `/tmp/s3_dir_test` from S3' do
    expect(chef_run).to create_s3_dir('/tmp/s3_dir_test').with(
      bucket:            's3dir-test-bucket',
      dir:               '/s3_dir_test',
      access_key_id:     'TEST_KEY',
      secret_access_key: 'TEST_SECRET'
    )
  end
end
