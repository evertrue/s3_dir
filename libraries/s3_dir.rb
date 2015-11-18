module S3Lib
  class Dir
    def self.dir_mode(mode)
      if mode.is_a?(String)
        mode =~ /^0/ || mode = "0#{mode}"
      elsif mode.to_s == mode.to_s(10)
        # Mode is in Fixnum::base 10
        mode = mode.to_s
      else
        mode = mode.to_s(8)
      end

      (-3..-1).each do |i|
        mode[i] = (mode[i].to_i + 1).to_s if !mode[i].to_i.zero? && mode.to_i.even?
      end
      mode
    end

    def s3_url
      return 'http://localhost:5000' if @is_mock
      return 'https://s3.amazonaws.com' if @region == 'us-east-1'
      "https://s3-#{@region}.amazonaws.com"
    end

    def initialize(access_key_id, secret_access_key, region, is_mock)
      require 'uri'

      @access_key_id = access_key_id
      @secret_access_key = secret_access_key
      @region = region
      @is_mock = is_mock
    end

    def build_mock_env(bucket, dir)
      dir.sub!(%r{/$}, '')
      dir.sub!(%r{^/}, '')

      d = connection.directories.create(
        key: bucket,
        public: true
      )
      d.files.create(key: "#{dir}/testdir/", body: "content\n", public: true)
    end

    def ls(bucket, dir)
      dir.sub!(%r{/$}, '')
      dir.sub!(%r{^/}, '')

      bucket_obj = connection.directories.get(bucket)
      fail "Bucket #{bucket} not found." if bucket_obj.nil?

      # 'files' is not a proper array and sometimes mishandles 'select.'
      # This converts it.
      arr = []
      bucket_obj.files.each { |f| arr << f }
      listing = arr.select do |o|
        o.key =~ /^#{Regexp.escape(dir)}/ &&
        o.key !~ %r{^#{Regexp.escape(dir)}/$}
      end
      listing.map { |o| o.key.sub(%r{^#{Regexp.escape(dir)}/}, '/') }
    end

    private

    def connection
      @connection ||= begin
        require 'fog'

        Fog.mock! if @is_mock

        options = { aws_access_key_id: @access_key_id,
                    aws_secret_access_key: @secret_access_key,
                    region: @region,
                    path_style: true }

        [
          :host,
          :port,
          :scheme
        ].map { |key| options[key] = URI(s3_url).send(key) } if @is_mock

        Fog::Storage::AWS.new(options)
      end
    end
  end
end
