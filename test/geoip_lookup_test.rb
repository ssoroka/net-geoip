require 'test/unit'
require 'geoip_test_helpers'

require 'net/geoip'


class GeoIPLookupTest < Test::Unit::TestCase
  include GeoIPTestHelpers
  
  def setup
    @geoip = Net::GeoIP.new(Net::GeoIP::GEOIP_COUNTRY_EDITION)
  end
  
#  def test_should_bitch_when_indexed_with_non_string
#    assert_raises(TypeError) { @geoip[0] }
#  end
  
  def test_should_get_jp
#    assert_equal 'JP', @geoip.country_code_by_addr('zxy.de');
    assert_equal 'JP', @geoip.country_code_by_addr('203.174.65.12');
  end
  def test_should_get_fr
    assert_equal 'FR', @geoip.country_code_by_addr('212.208.74.140');
  end
  def test_should_get_de
    assert_equal 'DE', @geoip.country_code_by_addr('134.102.101.18');
  end
  
end
