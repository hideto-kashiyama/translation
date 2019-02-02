module HomeHelper
    require 'net/http'
    require 'uri'
    require 'json'
    require 'fileutils'
    
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

def fdel
   #音声ファイルすべて削除
  if Dir.glob("public/jsf/*").empty?
    
  else
 
    Dir.glob("public/jsf/*").each do |file_name|
      File.delete(file_name)
    end
    
  end
  
end

# ---------------------------------------------
# AITalk音声合成　 参考サイトhttps://qiita.com/zaki_taka4/items/fed34a01759d946c7ee9
# ---------------------------------------------

def atk
  
  if @speakval.nil?
  
  else
 
  params = {
    username: ENV["AITalkID"],
    password: ENV["AITalkPW"],
    ext: 'mp3',
    text: @speakval,
    speaker_name: 'nozomi_emo'
  }
 
  
 endpoint = URI.parse('http://webapi.aitalk.jp/webapi/v2/ttsget.php' + '?' + params.to_query)

  res = Net::HTTP.get_response(endpoint)

   case res
    when Net::HTTPSuccess
    
      file_name = "public/tempmp3/" + @fnval + ".mp3"
     # file_name = "<%=Settings.mp3.root_path%>/"+ @fnval + ".mp3"
     
      File.binwrite(file_name, res.body)
      
    
  　  else
  　 
  　 puts "failed"
  　 
    end
  
   end
  
 end
  
end


