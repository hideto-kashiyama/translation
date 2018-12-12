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


$(function(){
    
    $('#blink').click(function() {
        
        location.href="/home/master";
    
     });
});

$(function(){
    
    $('#tlink').click(function() {
        
        recstop();//録音停止
        
        var param = $("#result_text").val();
        param = encodeURIComponent(param);
         
        var paramt = $("#txtTarget").val();
        paramt= encodeURIComponent(paramt);
        
          //文字が入ってる時だけ実行
        if (param != ""){
             
            if (paramt != ""){
      
             window.location.href="/home/ctg?param=" + param +"&" + "?paramt=" + paramt;
      　　　
      　　　 }else{
      　　　 
      　　　 alert('翻訳文がありません' );
      　　　     
      　　　}
      　　　
        }else{
            
            
　            alert('テキストがありません');
            
        }　
    
       
    });
});


 var stopflag=1; //録音状態　1: 停止状態　0:録音中状態

 var jeflag=1; //言語切り替えフラグ　1: 日本語　0:英語

 var gid; //言語判定　1: 日本語　0:英語
 
　 // 録音(音声認識)による翻訳開始
　function recstart() { //音声入力開始
　      $('#recap').hide();//現在音声入力停止中
　     
　      if (stopflag==1) { //停止状態なら　初期状態
　     　  console.log('初期状態');
　         recognition.start();//startして
　         stopflag=0;//start状態にする
　           var txt;
　           if (jeflag==1) {
　               
    　         $('#rscap').text("");//音声入力開始を消す
          　   $('#rscap').text("日本語認識中..");
              tenmetu('mic');//点滅
    　         $('#rscap').css('color','green'); 
                gid=1;
                
　           } else {
　               
　                $('#rscap').text("");//音声入力開始を消す
              　   $('#rscap').text("英語認識中....");
                  tenmetue('mic');//点滅
　 　             $('#rscap').css('color', 'Red');
                gid=0;
　               
　           }
　           
　     } else {　//録音中なら
　        console.log('録音中');
　     
           if (jeflag==1) {
               
                   recognition.stop()
                   
                   jeflag=0;
                   
                      $('#rscap').text("");//音声入力開始を消す
                  　   $('#rscap').text("英語認識中....");
                      tenmetue('mic');//点滅
                    $('#rscap').css('color', 'Red');
                    gid=0;
                    
                   
                } else {
                    recognition.stop()
                   
                    jeflag=1;
                    
                     $('#rscap').text("");//音声入力開始を消す
                  　 $('#rscap').text("日本語認識中..");
                     tenmetu('mic');//点滅
                    $('#rscap').css('color', 'green');
                    gid=1;
                
                }
    
　     }         
　     
　 }
　 
　  function recstop() {　//音声入力停止
　      
　      recognition.stop()
　      stopflag=1;
　      $('#rscap').text("音声入力開始");
        $('#rscap').css('color', 'black');
        $('.mic').css('background-color', 'white');
        $('#recap').show();
        $('.translabel').text("");
　      
　  }
　 
　 window.SpeechRecognition = window.SpeechRecognition || webkitSpeechRecognition;
           var recognition = new webkitSpeechRecognition();
           recognition.interimResults = true;
        　 recognition.continuous = true;
           //最大2個の認識仮説を取得する
           //recognition.maxAlternatives = 2;
           
           recognition.onstart = function() {
                 if (gid==1) { 
                   recognition.lang='ja-JP';
                   console.log("日本語認識中");
                 } else {
                     
                      recognition.lang='en-US';
                　　　console.log("英語認識中");
                 }
             　　
             　　recognition.onnomatch = function() {
               
               　　　 $('#result_text').text("もう一度試してください");
               
          　　　  };
            
            };
            
             recognition.onspeechstart= function() {
                 
                 if (gid==1) { 
                     
                   recognition.lang='ja-JP';
                   console.log("会話中日本語認識中");
                   
                 } else {
                     
                  recognition.lang='en-US';
            　　　console.log("録音状態からリスタート");
                 } 
             
             };   
                 
            
         
            recognition.onend= function() {
                
                if (stopflag==0) { 
                    
                   recognition.start();
                 
                 }
                
            }
            
           
            recognition.onresult = function(event) {
                var results = event.results;
                for (var i = event.resultIndex; i < results.length; i++) {
                    if (results[i].isFinal) {
                       
                          $('#result_text').text(results[i][0].transcript);
                         
                          gengochk(results[i][0].transcript);
                         
                          $("#tbtn").click();//翻訳開始
                       
                         }
                     
                    }
                };
                
                if (stopflag==0) {　//録音中なら
                
                   recognition.onend = () => { recognition.start() };
                
                }

               // recognition.start();

   /*ここまで録音による翻訳*/

//#result_textに文字を直接入力またはコピペした場合の翻訳
//言語判定　gid取得 　1: 日本語　0:英語
 function gengochk(value) { // 録音による翻訳の言語判定（日本語か英語か）に使う
　    
                let error;
                
                if(value.match(/[ぁ-ん]/g)){ //ひらがな含む
                    
                  error = true;
                  
                } else if (value.match(/[\u4E00-\u9FFF]/)) {　//漢字のみ　例えば　「明日」など
            
                　 error = true; 
                  
                }
                
                if(error){
                    
                    gid=1;
                    console.log("japanese!"+gid);
                   
                 
                }else{
                    
                    gid=0;
                    console.log("english!"+gid);
                   
                }
   
　}
//$(function() {
  
 　$("#result_text").keyup(function(e){
 　   
     if(e.which == 13){　//エンターキー　アップ時
               //result_text"の言語判定　gid取得
         　　　　　let error;
                let value = $(this).val();
                
                if(value.match(/[ぁ-ん]/g)){
                    
                  error = true;
                } else if (value.match(/[\u4E00-\u9FFF]/)) {
                    
                   error = true; 
                  //m = t.match(/[\u4E00-\u9FFF]/); 
                  
                }
                
                if(error){
                    
                    gid=1;
                    console.log("japanese!"+gid);
                　  
                    $("#tbtn").click();//翻訳開始
                    
                }else{
                    
                    gid=0;
                    console.log("english!"+gid);
                   
                    $("#tbtn").click();//翻訳開始
                    
                }
                //ここまで#result_textに文字を直接入力またはコピペした場合の翻訳
　　　　　
     }
     
　});
　
//}); 

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

//もう一度しゃべる
function speak() {

 var text = $('#txtTarget').val();
 
 if (text!="") {

    var uttr = new SpeechSynthesisUtterance();
    uttr.text = text;
    
    if(gid==1) {
       uttr.lang = 'en-US';
      } else {
      
         uttr.lang = 'ja-JP';
     }
  
   speechSynthesis.speak(uttr);
  
  } else {
      
      alert("テキストがありません。")
  }
 
}

function txtclear() {　　//テキストクリア
    
     $('#result_text').val("");
     $('#txtTarget').val("");
     $('.translabel').hide();
     
}

 function wfin(txt,idv) { //タイプライターのようにテキストを1文字ずつ表示させる関数
     　　　//txt:テキスト　idv 囲む要素のid
     　　　    var txtArr = txt.split("");
            var count = 0;
        
            var txtCount = function() {
                var timer = setTimeout(txtCount, 250);
                $('.'+idv).append(txtArr[count]);
                count++;
                if (count == txtArr.length) {
                    clearTimeout(timer);
                }
            }
        
            txtCount();

    }
    
　//jquery.flicker.jsを使った要素点滅
function tenmetu(v) {　//日本語
    
        $('.'+v).flicker({
            'reps': 2, 
            'pause': 200, 
            'delay': 800,
             'color': '#CCFFCC'   
           
        });
        
         /*'reps': 2, //点滅する回数です。
            'pause': 200, //点滅して色がついている時の時間の長さです'color': '#CCFFCC'   
            'delay': 800, //点滅する間隔です
            'color': '#CCFFCC' //色を設定できます*/
        
}  
function tenmetue(v) {　//英語
    
        $('.'+v).flicker({
            'reps': 2, 
            'pause': 200, 
            'delay': 800,
             'color': '#FFDDFF'     
           
        });
        
         /*'reps': 2, //点滅する回数です。
            'pause': 200, //点滅して色がついている時の時間の長さです'color': '#CCFFCC'   
            'delay': 800, //点滅する間隔です
            'color': '#e55' //色を設定できます*/
        
}  


function tenmetut(v) {　//翻訳完了！
    
        $('.'+v).flicker({
            'reps': 5, 
            'pause': 200, 
            'delay': 800,
             'color': '#CCFFFF'     
           
        });
        
         /*'reps': 2, //点滅する回数です。
            'pause': 200, //点滅して色がついている時の時間の長さです'color': '#CCFFCC'   
            'delay': 800, //点滅する間隔です
            'color': '#e55' //色を設定できます*/
        
}  

//jquery.flicker.js プラグイン
(function( $ ){

	$.fn.flicker = function(options){

		var settings = {
			'reps'		: 10,
			'pause'		: 100,
			'delay'		: 400,
			'color'		: '#f00'
		};

		if ( options ) { 
			$.extend( settings, options );
		}
	
		return this.each( function() {

			$this = $(this);
			
			flashScreen($this, settings.reps, settings.pause, settings.delay, settings.color); 
		});
	};

	flashScreen = function(obj, reps, pause, delay, color) {
		if (reps == 0)
			return false;

		_reps = reps;
		_pause = pause;
		_delay = delay;
		_color = color;
		_this = obj;
			
		background = obj.css('background-color');
		obj.css('background-color', color);
		setTimeout("_this.css('background-color', background);", pause);

		setTimeout('flashScreen(_this, _reps - 1, _pause, _delay, _color);', _delay);
	}	
		
})(jQuery);
　　
