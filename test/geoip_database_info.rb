require 'test/unit'
require 'geoip_test_helpers'

require 'net/geoip'


class GeoIPDatabaseInfoTest < Test::Unit::TestCase
  include GeoIPTestHelpers
  
  def setup
    @geoip = Net::GeoIP.new(city_database_filename)
  end
  
  def test_should_bitch_when_indexed_with_non_string
    assert_raises(TypeError) { @geoip[0] }
  end
  
  def test_should_get_geoip_database_info
    assert_equal 'US', @geoip.database_info
  end
  
end
