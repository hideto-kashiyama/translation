class HomeController < ApplicationController
  
before_action :authenticate_user!

  #def index
  
     # flash[:success] = "メッセージ"
      
  #end
  
 def index
  
    @transval = params[:transval]
    @target = params[:target]
    @source = params[:source]
    @speakval = params[:speakval]
    @fnval = params[:fnval]
    
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
       #@bunruis = Bunrui.all
       
        render layout: false #application.html.erbを適用したくない
       
  end
  
  def ctg
      
       @categories=Category.all
       
  end
  
 def tctop
    
       @bunruis = Bunrui.all
       
        render layout: false #application.html.erbを適用したくない
       
  end
  
  
  def tcctg
   
    @bunrui = Bunrui.find_by_id(params[:bunrui_id])
    @page_title = @bunrui.bunrui
      
       @tccategories=Tccategory.where(bunrui_id: params[:bunrui_id])
       
         render layout: false #application.html.erbを適用したくない
         
  end
 
 
   def tc
    
     @tcmasters=Tcmaster.where(tccategory_id: params[:tccategory_id])
     @tccategory=Tccategory.find_by_id(params[:tccategory_id])
     @title = @tccategory.ctg
     
     
     render layout: false #application.html.erbを適用したくない
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
   
   def count
    
     @counts=Count.all
    
   end
   
   def counts
    
        countg=Count.new(user_id: 11, dt: params[:cntdt], chrcnt: params[:cntgoogle], kubun: 1)
        countg.save
     
        counta=Count.new(user_id: 11, dt: params[:cntdt], chrcnt: params[:cntait], kubun: 0)
        counta.save
      
      redirect_to :action => "index"
   
   end
  
end
