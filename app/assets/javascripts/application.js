// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

 // DOMの準備ができたら呼ばれる。
$(function() {
    
    $(".alert i.fa-times").on("click", function(){
      $(".alert").hide();
    });
    
});

//翻訳→音声合成
function trans() {
    
     var txt1;
    
　   txt1="翻訳中..........."
　   wfin(txt1,'translabel');//1文字ずつタイプライター風に表示する
　   
  //helpers/home_helper.rb  translate英訳　translatej 和訳
  if(gid==1) {
       
      var transtext="<%= translatej %>";
 
       
       
     } else {
     
      
     var transtext="<%= translate%>";
    　 
     }  
 
 var txt=transtext.replace( /&amp;#39;/g , "'" );

 $('#txtTarget').val(txt);
 
 //音声合成
 
     // unsupported.
    /*if (!'SpeechSynthesisUtterance' in window) {
        alert('Speech synthesis(音声合成) APIには未対応です.');
        return;
    }*/
   
    var text =  $('#txtTarget').val();
 
    var uttr = new SpeechSynthesisUtterance();
    uttr.text = text;
    
     if(gid==1) {
       uttr.lang = 'en-US';
     } else {
     
        uttr.lang = 'ja-JP';
     }
 
  speechSynthesis.speak(uttr);
  
 // $(function(){
      
    setTimeout(function(){
        txt1="";
        $('.translabel').text("");
        $('.translabel').text("翻訳完了！");
        tenmetut('translabel');//点滅
        
    },2000);
    
　// });
   

}
