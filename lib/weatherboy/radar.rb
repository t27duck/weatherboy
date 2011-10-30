class Weatherboy
  class Radar
    
    attr_reader :image_url, :url
  
    def initialize(doc)
      @image_url = doc.elements['image_url'].text
      @url = doc.elements['url'].text
    end   
    
  end
end
