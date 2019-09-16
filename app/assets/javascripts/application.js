// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require_tree .




$(function() {
    $('.slider').slick({  　　　　　　//TOPページ jQueryスリックの記述
        //jQueryスリックのオプション　
            autoplay: true,　      // 自動再生。trueで自動再生される。
            autoplaySpeed:3000,    // 自動再生や左右の矢印でスライドが動くスピード
            speed:1000,             //スライドするスピード
            prevArrow:'',          //prevボタンをなくす。
            nextArrow:'',          //prevボタンをなくす。
    });
});


$(function(){  //TOPページ　　文字を右からfadeさせる記述

var ScrollrevealFade = {

    origin: 'right',

    distance: '100px',//移動範囲

    scale: 1,//拡大表示（１で横スクロールが始まる）

    rotate: { x: 0, y: 0, z: 0 }, //xは縦回転、yは横回転、zは傾き（風車みたいな感じ）

    duration: 1000, //アニメーションの速度

    delay :1600 //要素が表示するまでの待機時間（ディレイ）
};

    window.sr= new ScrollReveal();
    sr.reveal('.feature', ScrollrevealFade, 100);

});


$(function(){  //TOPページ　文字を左からfadeさせる記述

    var ScrollrevealFade = {
    
        origin: 'left',
    
        distance: '100px',//移動範囲
    
        scale: 1,//拡大表示（１で横スクロールが始まる）
    
        rotate: { x: 0, y: 0, z: 0 }, //xは縦回転、yは横回転、zは傾き（風車みたいな感じ）
    
        duration: 1200, //アニメーションの速度
    
        delay :1000 //要素が表示するまでの待機時間（ディレイ）
    };
    
        window.sr= new ScrollReveal();
        sr.reveal('.image', ScrollrevealFade, 100);
    
    });
    