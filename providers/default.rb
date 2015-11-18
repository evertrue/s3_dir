use_inline_resources

action :create do
  directory new_resource.name do
    owner     new_resource.owner
    group     new_resource.group
    mode      S3Lib::Dir.dir_mode new_resource.mode
    action    :create
    recursive new_resource.recursive
  end

  s3_dir_lib = S3Lib::Dir.new(
    new_resource.access_key_id,
    new_resource.secret_access_key,
    new_resource.region,
    new_resource.mock
  )

  s3_dir_lib.build_mock_env(
    new_resource.bucket,
    new_resource.dir
  ) if new_resource.mock

  remote_dir_contents = s3_dir_lib.ls(
    new_resource.bucket,
    new_resource.dir
  )

  # Breaking out the directories here and processing them separately allows
  # us to avoid creating duplicate resources and gets around the fact that
  # s3_file cannot create paths recursively.
  directories = remote_dir_contents.map do |f|
    f[-1] == '/' ? f.sub(%r{/$}, '') : ::File.dirname(f)
  end.uniq

  directories.each do |dir|
    Chef::Log.debug "Processing directory: #{dir}"
    directory "#{new_resource.name}/#{dir}" do
      owner     new_resource.owner
      group     new_resource.group
      mode      S3Lib::Dir.dir_mode new_resource.mode
      action    :create
      recursive true
    end
  end

  remote_dir_contents.reject { |f| f[-1] == '/' }.each do |filename|
    Chef::Log.debug "Processing file: #{filename}"
    s3_file "#{new_resource.name}/#{filename}" do
      remote_path "#{new_resource.dir}/#{filename}"
      bucket new_resource.bucket
      aws_access_key_id new_resource.access_key_id
      aws_secret_access_key new_resource.secret_access_key
      owner new_resource.owner
      group new_resource.group
      mode new_resource.mode
      s3_url "#{s3_dir_lib.s3_url}/#{new_resource.bucket}"
      action :create
    end
  end
end
