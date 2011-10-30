class Weatherboy
  class Alert
    
    attr_reader :description, :date, :message
  
    def initialize(doc)
      @description = doc.elements['description'].text
      @date = doc.elements['date'].text
      @message = doc.elements['message'].text
    end   
    
  end

end
