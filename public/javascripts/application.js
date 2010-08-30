// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
$(document).ready(function(){
 
$("a.tip").click(function() {

%(this).next(".top_wrapper").css({position:"absolute",top:"0",left:"0",width:"100%",height:"100%"})
$(this).next("div.top").stop(true, true).animate({opacity: "show", top: "-105"}, "slow");
});
 
});

$(".top").click(function(){
  
  $(this).animate({opacity: "hide", top: "-150"}, "fast");
})

