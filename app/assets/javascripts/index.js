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
