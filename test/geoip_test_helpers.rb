module GeoIPTestHelpers

private
  def city_database_filename
    File.dirname(__FILE__) + '/../data/GeoIPCity-531.dat'
#    '/usr/local/share/GeoIP//GeoIPCity.dat'
  end

end
