name             's3_dir'
maintainer       'EverTrue, Inc.'
maintainer_email 'devops@evertrue.com'
license          'Apache v2.0'
description      'Installs/Configures s3_dir'
long_description 'Installs/Configures s3_dir'
version          '1.4.1'

source_url 'https://github.com/evertrue/s3_dir/' if respond_to?(:source_url)
issues_url 'https://github.com/evertrue/s3_dir/issues' if respond_to?(:issues_url)

supports 'ubuntu', '= 14.04'

depends 's3_file', '>= 2.5.0'
depends 'et_fog',  '~> 1.0'
