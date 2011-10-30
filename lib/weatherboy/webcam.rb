class Weatherboy
  class Webcam
    attr_reader :handle, :camid, :assoc_station_id, :link, :link_text, :organization, :cameratype, :neighborhood, :zip, :city, :state, :country, :updated, :image_url, :widget_url, :cam_url
  
    def initialize(doc)
      @handle = doc.elements['handle'].text
      @camid = doc.elements['camid'].text
      @assoc_station_id = doc.elements['assoc_station_id'].text
      @link = doc.elements['link'].text
      @link_text = doc.elements['linktext'].text
      @organization = doc.elements['organization'].text
      @cameratype = doc.elements['cameratype'].text
      @neighborhood = doc.elements['neighborhood'].text
      @zip = doc.elements['zip'].text
      @city = doc.elements['city'].text
      @state = doc.elements['state'].text
      @country = doc.elements['country'].text
      @updated = doc.elements['updated'].text
      @image_url = doc.elements['CURRENTIMAGEURL'].text
      @widget_url = doc.elements['WIDGETCURRENTIMAGEURL'].text
      @cam_url = doc.elements['CAMURL'].text
    end   
  end
end
