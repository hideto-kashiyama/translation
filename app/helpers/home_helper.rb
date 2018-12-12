module HomeHelper
    require 'net/http'
    require 'uri'
    require 'json'
    
def translate 
    
    url = URI.parse('https://www.googleapis.com/language/translate/v2')
      
      params = {
         
        q: @transval,
        target: "en",
        source: "ja",
        key: ENV["GAPIKEY"]
        
        
      }
      url.query = URI.encode_www_form(params)
      res = Net::HTTP.get_response(url)
      
      json = res.body
      # レスポンスのjsonの言語の翻訳結果の部分のパラメータをパースする
      "#{JSON.parse(json)["data"]["translations"].first["translatedText"]}"
      
      #JSON.parse(res.body)["data"]["translations"].first["translatedText"]
     
end


def translatej 
    
    url = URI.parse('https://www.googleapis.com/language/translate/v2')
    
    
      params = {
         
        q: @transval,
        target: "ja",
        source: "en",
        key: ENV["GAPIKEY"]
        
      }
    
  url.query = URI.encode_www_form(params)
  res = Net::HTTP.get_response(url)
  json = res.body
  # レスポンスのjsonの言語の翻訳結果の部分のパラメータをパースする
  "#{JSON.parse(json)["data"]["translations"].first["translatedText"]}"
  
end

def test
 
 print 'こんにちは'

end

end
