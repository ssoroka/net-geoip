require 'test/unit'
require 'geoip_test_helpers'

require 'net/geoip'


class GeoIPOpenTypeTest < Test::Unit::TestCase
  include GeoIPTestHelpers
  
  def setup
    @geoip = Net::GeoIP.new(5);
  end
  
  
  def test_should_get_geoip_record_when_indexing_geoip_with_string
    assert_equal 'Hosteurope GmbH', @geoip.name_by_name('www.2bz.de');
  end
  
end
