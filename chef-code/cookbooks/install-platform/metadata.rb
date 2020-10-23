name 'install-platform'
maintainer 'DennyZhang.com'
maintainer_email 'contact@dennyzhang.com'
license 'All rights reserved'
description 'Dummy chef cookbook'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '0.0.1'
source_url 'https://www.dennyzhang.com'

supports 'ubuntu'

depends 'sc-mongodb'    # depends on chef version [">= 14.0"]

