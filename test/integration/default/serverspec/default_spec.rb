require 'spec_helper'

describe 'S3 Dir test' do
  describe file '/tmp/s3_dir_test/subdir/d1/d2/d3/d4' do
    it { should be_directory }
    it { should be_mode 775 }
  end

  describe file '/tmp/s3_dir_test/subdir/d1/d2/d3/d4/file' do
    it { should be_file }
  end
end
