class Weatherboy
  class Current
    
    attr_reader :icon, :weather, :temp_f, :temp_c, :relative_humidity, :wind_dir, :wind_mph, :pressure_mb, :pressure_in, :dewpoint_f, :dewpoint_c
    attr_reader :heat_index_f, :heat_index_c, :windchill_f, :windchill_c, :windchill_c, :visibility_mi, :visibility_km
  
    def initialize(doc)
      @icon = "http://icons-ecast.wxug.com/graphics/conds/#{doc.elements['current_observation/icon'].text}.gif"
      @weather = doc.elements['current_observation/weather'].text
      @temp_f = doc.elements['current_observation/temp_f'].text
      @temp_c = doc.elements['current_observation/temp_c'].text
      @relative_humidity = doc.elements['current_observation/relative_humidity'].text
      @wind_dir = doc.elements['current_observation/wind_dir'].text
      @wind_mph = doc.elements['current_observation/wind_mph'].text
      @pressure_mb = doc.elements['current_observation/pressure_mb'].text
      @pressure_in = doc.elements['current_observation/pressure_in'].text
      @dewpoint_f = doc.elements['current_observation/dewpoint_f'].text
      @dewpoint_c = doc.elements['current_observation/dewpoint_c'].text
      @heat_index_f = doc.elements['current_observation/heat_index_f'].text
      @heat_index_c = doc.elements['current_observation/heat_index_c'].text
      @windchill_f = doc.elements['current_observation/windchill_f'].text
      @windchill_c = doc.elements['current_observation/windchill_c'].text
      @windchill_c = doc.elements['current_observation/windchill_c'].text
      @visibility_mi = doc.elements['current_observation/visibility_mi'].text
      @visibility_km = doc.elements['current_observation/visibility_km'].text
    end   
    
  end

end
