class HomeController < ApplicationController
  
 before_action :authenticate_user!
  #def index
     # flash[:success] = "メッセージ"
      
  #end
  
  #require 'rest-client'
  
   # require 'net/https'
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
 
  def master
      
       @categories=Category.all
       @masters = Master.where(category_id: params[:category_id])
       #@masters = Master.all
       
  end
  
  def e100
      
     @ctg = Category.find_by_id(params[:category_id])
   # @masters = Master.all
    @masters = Master.where(category_id: params[:category_id])
      
  end
  
  def ctg
      
       @categories=Category.all
       
  end
 
   def ctgs 
    
     str = Time.now.to_s

     tval=str.gsub(/[^0-9]/,"")

     dtval="8-"+ tval[2...-4]+".mp3"
     #音声データのファイル名作成

     master=Master.new(user_id: 9, j: params[:jtxt], e: params[:etxt], memo: params[:mtxt], category_id: params[:st], dt: Time.now, fn: dtval)
     master.save
     
     redirect_to :action => "index"
 
   end
 
 

end
