require 'test/unit'
require 'geoip_test_helpers'

require 'net/geoip'


class GeoIPRecordLookupTest < Test::Unit::TestCase
  include GeoIPTestHelpers
  
  def setup
    @geoip = Net::GeoIP.new(city_database_filename)
  end
  
  def teardown
    @geoip = nil
  end
  
  # country_code
  
  def test_should_find_US_for_yahoo_country_code
    assert_equal 'US', @geoip['216.109.112.135'].country_code
  end

  def test_should_find_CA_for_bravenet_country_code
    assert_equal 'CA', @geoip['bravenet.com'].country_code
  end
  
  def test_should_raise_exception_for_localhost_from_country_code
    assert_raises(Net::GeoIP::RecordNotFoundError) { @geoip['127.0.0.1'].country_code }
  end
  
  # country_code3
  
  def test_should_find_USA_for_yahoo_country_code3
    assert_equal 'USA', @geoip['216.109.112.135'].country_code3
  end

  def test_should_find_CAN_for_yahoo_country_code3
    assert_equal 'CAN', @geoip['bravenet.com'].country_code3
  end
  
  def test_should_raise_exception_for_localhost_from_country_code3
    assert_raises(Net::GeoIP::RecordNotFoundError) { @geoip['127.0.0.1'].country_code3 }
  end
  
  # country_name
  
  def test_should_find_United_States_for_yahoo_country_name
    assert_equal 'United States', @geoip['216.109.112.135'].country_name
  end

  def test_should_find_Canada_for_bravenet_country_name
    assert_equal 'Canada', @geoip['bravenet.com'].country_name
  end
  
  def test_should_raise_exception_for_localhost_from_country_name
    assert_raises(Net::GeoIP::RecordNotFoundError) { @geoip['127.0.0.1'].country_name }
  end
  
  # region
  
  def test_should_find_CA_for_yahoo_region
    assert_equal 'CA', @geoip['216.109.112.135'].region
  end
  
  def test_should_find_BC_for_bravenet_region
    assert_equal 'BC', @geoip['bravenet.com'].region
  end

  def test_should_raise_exception_for_localhost_from_region
    assert_raises(Net::GeoIP::RecordNotFoundError) { @geoip['127.0.0.1'].region }
  end
  
  # city
  
  def test_should_find_Sunnyvale_for_yahoo_city
    assert_equal 'Sunnyvale', @geoip['216.109.112.135'].city
  end
  
  def test_should_find_Parksville_for_bravenet_city
    assert_equal 'Parksville', @geoip['bravenet.com'].city
  end
  
  def test_should_raise_exception_for_localhost_from_city
    assert_raises(Net::GeoIP::RecordNotFoundError) { @geoip['127.0.0.1'].city }
  end
  
  # postal_code
  
  def test_should_find_94089_for_yahoo_postal_code
    assert_equal '94089', @geoip['216.109.112.135'].postal_code
  end
  
  def test_should_find_v9p2h5_for_bravenet_postal_code
    assert_equal 'v9p2h5', @geoip['bravenet.com'].postal_code
  end
  
  def test_should_raise_exception_for_localhost_from_postal_code
    assert_raises(Net::GeoIP::RecordNotFoundError) { @geoip['127.0.0.1'].postal_code }
  end
  
  # latitude
  
  def test_should_find_correct_latitude_for_yahoo
    assert_in_delta 37.424900, @geoip['216.109.112.135'].latitude, 0.0001
  end
  
  def test_should_find_correct_latitude_for_bravenet
    assert_in_delta 49.2999992370605, @geoip['bravenet.com'].latitude, 0.0001
  end
  
  def test_should_raise_exception_for_localhost_from_latitude
    assert_raises(Net::GeoIP::RecordNotFoundError) { @geoip['127.0.0.1'].latitude }
  end
  
  # longitude

  def test_should_find_correct_longitude_for_yahoo
    assert_in_delta  -122.007401, @geoip['216.109.112.135'].longitude, 0.0001
  end
  
  def test_should_find_correct_longitude_for_bravenet
    assert_in_delta -124.316703796387, @geoip['bravenet.com'].longitude, 0.0001
  end
  
  def test_should_raise_exception_for_localhost_from_latitude
    assert_raises(Net::GeoIP::RecordNotFoundError) { @geoip['127.0.0.1'].latitude }
  end
  
  # dma_code
  
  def test_should_find_correct_dma_code_for_yahoo
    assert_equal 807, @geoip['216.109.112.135'].dma_code
  end
  
  def test_should_find_correct_dma_code_for_bravenet
    assert_equal 0, @geoip['bravenet.com'].dma_code
  end
  
  def test_should_raise_exception_for_localhost_from_dma_code
    assert_raises(Net::GeoIP::RecordNotFoundError) { @geoip['127.0.0.1'].dma_code }
  end
  
  # area_code
  
  def test_should_find_correct_area_code_for_yahoo
    assert_equal 408, @geoip['216.109.112.135'].area_code
  end
  
  def test_should_find_correct_area_code_for_bravenet
    assert_equal 0, @geoip['bravenet.com'].area_code
  end
  
  def test_should_raise_exception_for_localhost_from_area_code
    assert_raises(Net::GeoIP::RecordNotFoundError) { @geoip['127.0.0.1'].area_code }
  end
  
end
