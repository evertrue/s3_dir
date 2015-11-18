name             's3_dir'
maintainer       'EverTrue, Inc.'
maintainer_email 'devops@evertrue.com'
license          'Apache v2.0'
description      'Installs/Configures s3_dir'
long_description 'Installs/Configures s3_dir'
version          '1.4.1'

supports 'ubuntu', '= 14.04'

depends 's3_file', '>= 2.5.0'
depends 'et_fog',  '~> 1.0'
