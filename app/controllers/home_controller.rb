class HomeController < ApplicationController
  
   #before_action :authenticate_user!
  #def index
     # flash[:success] = "メッセージ"
      
  #end
  
  #require 'rest-client'
  
    require 'net/http'
    require 'uri'
    require 'json' 
  
 def index
    @transval = params[:transval]
   
    respond_to do |format|
      format.html
      format.js
    end
 
  end
  
  def ibmttsj 
  
    fstr = params[:fstr]
    
    json_file_path = "/home/ubuntu/workspace/ja.json"
    
    # 読み込んで
    json_data = open(json_file_path) do |io|
      JSON.load(io)
    end
    
    # 更新して
    json_data['text'] =fstr
    
    # 保存する
    open(json_file_path, 'w') do |io|
      JSON.dump(json_data, io)
    end
    
    #ja.jsonのテキストを音声変換　IBM　Watosn tts
    system('curl -X POST -u "6be0b124-83ba-4424-b77c-299a6bf12b30":"OVNSnRsKGavd" \
    --header "Content-Type: application/json" \
    --header "Accept: audio/wav" \
    --data @ja.json \
    --output ja.wav \
    "https://stream.watsonplatform.net/text-to-speech/api/v1/synthesize?voice=ja-JP_EmiVoice"')
   
   render action: :index
   
 end

end
