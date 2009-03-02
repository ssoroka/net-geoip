require 'mkmf'

dir_config('GeoIP')
have_library('GeoIP', 'GeoIP_new')

create_makefile('net/geoip')
