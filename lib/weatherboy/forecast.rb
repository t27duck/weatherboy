class Weatherboy
  class Forecast
    
    attr_reader :high_f, :high_c, :low_f, :low_c, :conditions, :icon, :pop, :title, :text
  
    def first_pass(doc)
      @high_f = doc.elements['high/fahrenheit'].text
      @high_c = doc.elements['high/celsius'].text
      @low_f = doc.elements['low/fahrenheit'].text
      @low_c = doc.elements['low/celsius'].text
      @conditions = doc.elements['conditions'].text
      @icon = "http://icons-ecast.wxug.com/graphics/conds/#{doc.elements['icon'].text}.gif"
      @pop = doc.elements['pop'].text
    end
    
    def second_pass(doc)
      @title = doc.elements['title'].text
      @text = doc.elements['fcttext'].text
    end
    
  end
end
