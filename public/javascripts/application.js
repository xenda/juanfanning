// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
$(document).ready(function(){
 
$("a.tip").click(function() {
$(this).next("div.top").stop(true, true).animate({opacity: "show", top: "-105"}, "slow");
});
 
});

$(".top").click(function(){
  
  $(this).animate({opacity: "hide", top: "-150"}, "fast");
})

