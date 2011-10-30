require "weatherboy/version"
require "weatherboy/current"
require "weatherboy/alert"
require "weatherboy/forecast"
require "weatherboy/webcam"
require "weatherboy/radar"

class Weatherboy
  require 'net/http'
  require 'rexml/document'
    
  attr_accessor :location
  # From http://wiki.wunderground.com/index.php/API_-_XML
    
  BASE_URL = "http://api.wunderground.com/auto/wui/geo/"
  
  def initialize(loc=nil)
    @location = loc
  end
      
  def current
    verify
    doc = makeCall(BASE_URL+"WXCurrentObXML/index.xml?query=#{@location}")
    Weatherboy::Current.new(doc)
  end
  
  def alerts
    verify
    alerts = []
    doc = makeCall(BASE_URL+"AlertsXML/index.xml?query=#{@location}")
    doc.elements.each('alerts/alert/AlertItem') do |alert_doc|
      alerts << Weatherboy::Alert.new(alert_doc)
    end
    alerts
  end
  
  def forecasts
    verify
    forecasts = []
    doc = makeCall(BASE_URL+"ForecastXML/index.xml?query=#{@location}")
    doc.elements.each('forecast/simpleforecast/forecastday') do |forcastday|
      this_forecast = Weatherboy::Forecast.new
      this_forecast.first_pass(forcastday)
      forecasts << this_forecast
    end
    i = 0
    doc.elements.each('forecast/txt_forecast/forecastday') do |forecastday|
      forecasts[i].second_pass(forecastday)
      i = i + 1
    end
    forecasts
  end
  
  def media
    verify
    media = {:webcams => [], :radar => nil}
    doc = makeCall(BASE_URL+"GeoLookupXML/index.xml?query=#{@location}")
    doc.elements.each('location/webcams/cam') do |wc|
      media[:webcams] << Weatherboy::Webcam.new(wc)
    end
    media[:radar] = Weatherboy::Radar.new(doc.elements['location/radar'])
    media
  end


  private

  def verify
    raise "Weatherboy: Location not set. Can't make call." if @location.nil?
  end
      
  def makeCall(url)
    return REXML::Document.new( Net::HTTP.get_response(URI.parse(url)).body)
  end
end
