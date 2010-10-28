
$(document).ready(function(){

  $("select, input:checkbox, input:radio, input:file").uniform();
  SimplyButtons.init();
  $("button#find_me").click(function(){

     showAddress($("#project_address").val());
     return false;
   })

  
});
