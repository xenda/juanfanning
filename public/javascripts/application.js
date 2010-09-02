
// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

$(document).ready(function(){
 
 var searchBox = jQuery("input#terms"); 
 var defaultValue = searchBox.val(); 
 
  searchBox.click(function() {
  if( this.value == defaultValue ) {
  jQuery(this).val("");
  }
  });
  searchBox.blur(function() {
  if(jQuery.trim(this.value) == "") {
  jQuery(this).val(defaultValue);
  }
  });

  $("input#terms").autocomplete("auto_complete_for_project_issuer")


$("a.tip").click(function() {

       $(this).next("div.top").stop(true, true).animate({opacity: "show", top: "-25"}, "slow");

      $(document).trigger('click').one('click', {element:this}, function(e){
      $(e.data.element).next("div.top").animate({opacity: "hide", top: "-85"}, "fast");
      });

      return false;
  });



});




