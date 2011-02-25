$.ajaxSetup({ 
  'beforeSend': function(xhr) {xhr.setRequestHeader("Accept", "text/javascript")}
})

$(document).ready(function(){

  $("select, input:checkbox, input:radio, input:file").uniform();
  SimplyButtons.init();
  $("button#find_me").click(function(){

     showAddress($("#project_address").val());
     return false;
   })
   
   $(document).ajaxSend(function(event, request, settings) {
      // do nothing if this is a GET request. Rails doesn't need
      // the authenticity token, and IE converts the request method
      // to POST, just because - with love from redmond.
      if (settings.type == 'GET') return;
      if (typeof(AUTH_TOKEN) == "undefined") return;
      settings.data = settings.data || "";
      settings.data += (settings.data ? "&" : "") + "authenticity_token=" + encodeURIComponent(AUTH_TOKEN);
    });
  
});
