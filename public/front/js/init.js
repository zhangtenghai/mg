jQuery(document).ready(function($){

/*-------------------------------------------------------------------------*/
/*  1.  Head active
/*-------------------------------------------------------------------------*/


var pageHeaderHeight = parseInt($('#page-header-bg').attr('data-height'));
var pageHeadingHeight;

//set the user defined height
$('#page-header-bg').css('height',pageHeaderHeight+'px');
setTimeout(function(){ $('#page-header-bg').css('overflow','visible') },800);
  
function pageHeader(){
  
  if(!$('body').hasClass('mobile')){
    
    //recalc
    pageHeaderHeight = parseInt($('#page-header-bg').attr('data-height'));
    $('#page-header-bg .container > .row').css('top',0);
    
    //center the heading
    pageHeadingHeight = $('#page-header-bg .col.span_6').height();
    $('#page-header-bg:not("[data-parallax=1]") .col.span_6').css('top', (pageHeaderHeight/2) - (pageHeadingHeight/2) + 22);
    
    //center portfolio filters
    $('#page-header-bg:not("[data-parallax=1]") #portfolio-filters').css('top', (pageHeaderHeight/2) + 2);  
  }
  
  else {
    //recalc
    pageHeaderHeight = parseInt($('#page-header-bg').attr('data-height'));
    
    //center the heading
    var pageHeadingHeight = $('#page-header-bg .container > .row').height();
    $('#page-header-bg .container > .row').css('top', (pageHeaderHeight/2) - (pageHeadingHeight/2) + 12);
    
  }
  
  $('#page-header-bg .container > .row').css('visibility','visible');
}

pageHeader();
$(window).resize(pageHeader);

if($('#header-outer').attr('data-header-resize') == '' || $('#header-outer').attr('data-header-resize') == '0'){
  $('#page-header-wrap').css('margin-top','0');
}

 
  
/***************** Nav ******************/
  
  var logoHeight = parseInt($('#header-outer').attr('data-logo-height'));
  var headerPadding = parseInt($('#header-outer').attr('data-padding'));
  var usingLogoImage = $('#header-outer').attr('data-using-logo');
  
  if( isNaN(headerPadding) || headerPadding.length == 0 ) { headerPadding = 0; }
  if( isNaN(logoHeight) || usingLogoImage.length == 0 ) { usingLogoImage = false; logoHeight = 48;}
  
  //inital calculations
  function headerInit() {
      
    $('#header-outer .container').show();
    
    $('header#top nav > ul > li > a').css({
      'padding-bottom' : ((logoHeight/2) - ($('header#top nav > ul > li > a').height()/2)) + headerPadding,
      'padding-top' : (logoHeight/2) - ($('header#top nav > ul > li > a').height()/2)
    }); 
    
    $('#header-outer .cart-menu').css({  
      'padding-bottom' : Math.ceil(((logoHeight/2) - ($('header#top nav > ul > li > a').height()/2)) + headerPadding),
      'padding-top' : Math.ceil(((logoHeight/2) - ($('header#top nav > ul > li > a').height()/2)) + headerPadding)
    }); 
      
    $('header#top nav > ul li#search-btn').css({
      'padding-bottom' : (logoHeight/2) - ($('header#top nav > ul li#search-btn a').height()/2),
      'padding-top' : (logoHeight/2) - ($('header#top nav > ul li#search-btn a').height()/2)
    }); 
    
    
    $('header#top .sf-menu > li > ul, header#top .sf-menu > li.sfHover > ul').css({
      'top' : $('header#top nav > ul > li > a').outerHeight() 
    }); 
    
    
    setTimeout(function(){ 
      $('#search-outer #search-box .ui-autocomplete').css({
        'top': parseInt($('#header-outer').outerHeight())+'px'
      }); 
    },1000);
    
    $('#search-outer #search-box .ui-autocomplete').css({
      'top': parseInt($('#header-outer').outerHeight())+'px'
    });
    
  }
  
  //one last check to make sure the header space is correct (only if the user hasn't scrolled yet)
  $(window).load(function(){
    if($(window).scrollTop() == 0 ) { 
      
      if($('#header-outer').attr('data-using-secondary') == '1'){
        $('#header-space').css('height', parseInt($('#header-outer').outerHeight()) + 34);
      } else {
        $('#header-space').css('height', $('#header-outer').outerHeight());
      }
      
    }
  });
  
  
  //is header resize on scroll enabled?
  var headerResize = $('#header-outer').attr('data-header-resize');
  if( headerResize == 1 ){
    
    headerInit();
    
    $(window).bind('scroll',smallNav);
    
    //if user starts in mobile but resizes to large, don't break the nav
    if($('body').hasClass('mobile')){
      $(window).resize(headerInit);
    }
    
  }
  
  else {
    headerInit();
  }
    

  function smallNav(){
    var $offset = $(window).scrollTop();
    var $windowWidth = $(window).width();
    if($offset > 0 && $windowWidth > 1000) {
      
      $('#header-outer').addClass("active");

      $(window).unbind('scroll',smallNav);
      $(window).bind('scroll',bigNav);
    }
  }
  
  function bigNav(){
    var $offset = $(window).scrollTop();
    var $windowWidth = $(window).width();
    if($offset == 0 && $windowWidth > 1000) {
      
      $('#header-outer').removeClass("active");
      $(window).unbind('scroll',bigNav);
      $(window).bind('scroll',smallNav);
    }
  }

/*-------------------------------------------------------------------------*/
/*  2.  Scroll to top
/*-------------------------------------------------------------------------*/ 

var $scrollTop = $(window).scrollTop();

//starting bind
if( $('#to-top').length > 0 && $(window).width() > 1020) {
  
  if($scrollTop > 350){
    $(window).bind('scroll',hideToTop);
  }
  else {
    $(window).bind('scroll',showToTop);
  }
}


function showToTop(){
  
  if( $scrollTop > 350 ){

    $('#to-top').stop(true,true).animate({
      'bottom' : '17px'
    },350,'easeInOutCubic');  
    
    $(window).unbind('scroll',showToTop);
    $(window).bind('scroll',hideToTop);
  }

}

function hideToTop(){
  
  if( $scrollTop < 350 ){

    $('#to-top').stop(true,true).animate({
      'bottom' : '-30px'
    },350,'easeInOutCubic');  
    
    $(window).unbind('scroll',hideToTop);
    $(window).bind('scroll',showToTop); 
    
  }
}

//to top color
if( $('#to-top').length > 0 ) { 
  var $windowHeight, $pageHeight, $footerHeight, $ctaHeight;  
  function calcToTopColor(){
    $scrollTop = $(window).scrollTop();
    $windowHeight = $(window).height();
    $pageHeight = $('body').height();
    $footerHeight = $('#footer-outer').height();
    $ctaHeight = ($('#call-to-action').length > 0) ? $('#call-to-action').height() : 0;
    
    if( ($scrollTop-35 + $windowHeight) >= ($pageHeight - $footerHeight) && $('#boxed').length == 0){
      $('#to-top').addClass('dark');
    }
    
    else {
      $('#to-top').removeClass('dark');
    }
  } 
  //calc on scroll
  $(window).scroll(calcToTopColor);
  //calc on resize
  $(window).resize(calcToTopColor);
}

//scroll up event
$('#to-top').click(function(){
  $('body,html').stop().animate({
    scrollTop:0
  },800,'easeOutCubic')
  return false;
});

//if a clear is the last div, remove the padding
  if($('.container.main-content > .row > div:last-child').hasClass('clear')) {
    $('.container.main-content > .row > div:last-child').css('padding-bottom','0');
  }
  

/*-------------------------------------------------------------------------*/
/*  3.  Others
/*-------------------------------------------------------------------------*/ 
  //nav 

   $('.nav').delegate('>li','mouseover',function(e){ 
       $(this).siblings().find(".nav-dropbox").hide();   
       $(this).children(".nav-dropbox").show();
   }).delegate('>li','mouseout',function(e){ 
           $(this).children(".nav-dropbox").hide();
   }).delegate('.nav-dropbox li','mouseenter',function(){ 
       $(this).attr("class","act").siblings(".act").attr("class","");
   }).delegate('.nav-dropbox li','mouseleave',function(){ 
       $(this).attr("class","");
   });
   //login
  // var _islogin = true;
  // if(_islogin){
  //  $(".user-info").show();
  //  $(".user-login").hide();
  // }else{
  //  $(".user-info").hide();
  //  $(".user-login").show();
  // }
  
   $('.user-info').on('mouseenter',function(e){  
       $(this).children(".user-dropbox").fadeIn("slow");
   }).on('mouseleave',function(e){ 
       $(this).children(".user-dropbox").hide();
   }).delegate('.user-dropbox li','mouseenter',function(){ 
       $(this).attr("class","act").siblings(".act").attr("class","");
   });
   
   //view-all
   $('.game_comment').delegate('a.view-all','click',function(e){       
       $(this).prev("span").show();
     $(this).hide().siblings(".ellipsis").hide();
   });  
    $('.industry_wrap .bubble').delegate('a.view-all','click',function(e){       
       $(this).prev("span").show();
     $(this).hide().siblings(".ellipsis").hide();
   });  
   
   //like
   $('.main_container').delegate('a.like','click',function(e){ 
       if (!$(this).hasClass("fancybox")){
        if($(this).hasClass("like-active")){
          $(this).removeClass("like-active");   
        }else{
          $(this).addClass("like-active");
        } 
      }
   });
  
   $('.carousel_text').delegate('a.like','click',function(e){ 
       if (!$(this).hasClass("fancybox")){
        if($(this).hasClass("like-active")){
          $(this).removeClass("like-active");   
        }else{
          $(this).addClass("like-active");
        } 
      }
   });
   
  $('.hotreview_game').delegate('a.like','click',function(e){ 
       if (!$(this).hasClass("fancybox")){
        if($(this).hasClass("like-active")){
          $(this).removeClass("like-active");   
        }else{
          $(this).addClass("like-active");
        } 
      }
   });
   //单个游戏页 reply
   
   // $('.container_comment').delegate('a.reply','click',function(e){       
    //  var _txt =$(this).next("a").text();
    //  var _txtar =$('.container_comment').find("textarea");
    //  _txtar.focus();
    //  _txtar.text("@"+_txt+" ");
   // }); 
  
  //单个游戏页 star
   $('.vote-sub').delegate('.vote-star','mousemove',function(e){       
       var $mouse = e.pageX - $(this).offset().left;  
       var $span = Math.round($mouse/15)*10;   
     $(this).find('.vote-star-in').css("visibility","hidden");     
       $(this).find('.vote-star-pre').stop().animate({width:$span+'%'},50);          ;  
     if($span==100){  
            $('#vote-num').text('满星')     
       }else{  
            $('#vote-num').text($span/20+'星');  
       } 
   }).delegate('.vote-star','mouseleave',function(){  
       $(this).find('.vote-star-in').css("visibility","visible"); 
       $(this).find('.vote-star-pre').stop().animate({width:'0'},50); 
       var $mousex = $(this).find('.vote-star-in').width();  
       var $spanx = Math.round($mousex/15)*10;  
       if($spanx==100){  
            $('#vote-num').text('满星')     
        }else{  
            $('#vote-num').text($spanx/20+'星');  
        }     
    }).delegate('.vote-star','click',function(e){  
        var $mouse = e.pageX - $(this).offset().left;  
        var $span = Math.round($mouse/15)*10;  
        $(this).find('.vote-star-in').stop().animate({width:$span+'%'},100);    
     if($span==100){  
             $('#vote-num').text('满星')  ;   
         }
         $('#star').val($span/20)        
    });    
  //新闻栏目页 data-tab
   $('.date_tab').delegate('td','click',function(){       
       var _type = $(this).children().attr("class");
     if(_type == "normal"){
      alert("无事件,可添加");   
      }else if(_type == "event"){
      $('.date_tab').find(".active").removeClass("active");
      $(this).children().addClass("active");
      $('.aside_date .day').text($(this).children().text());
      $('.aside_date_tip').text($(this).children().text()+"号某某发布啊！");
    }
   }); 
   //fancybox
   $(".fancybox").fancybox({padding:0});


//end
});