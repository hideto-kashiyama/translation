module HomeHelper
    require 'net/http'
    require 'uri'
    require 'json'
    
def translate 
  
  if @transval.nil?
    
   else
        
    url = URI.parse('https://www.googleapis.com/language/translate/v2')
    
      params = {
         
        q: @transval,
        target: "en",
        source: "ja",
        key: ENV["GAPIKEY"]
        
      }
      
      url.query = URI.encode_www_form(params)
      res = Net::HTTP.get_response(url)
      Rails.logger.info(res)
        JSON.parse(res.body)["data"]["translations"].first["translatedText"]
  
  end
  
end


def translatej 
  
  if @transval.nil?
  
  else
      
     url = URI.parse('https://www.googleapis.com/language/translate/v2')
    
  
      params = {
         
        q: @transval,
        target: "ja",
        source: "en",
        key: ENV["GAPIKEY"]
        
      }
    
        url.query = URI.encode_www_form(params)
        res = Net::HTTP.get_response(url)
  
       JSON.parse(res.body)["data"]["translations"].first["translatedText"]
  
    end
 
end

end