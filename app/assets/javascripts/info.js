
$(document).ready(function(){
  $("#myform").bind('ajax:success',function(evt, xhr, status, error){
    	alert("evt: " + evt + "|status: " + status);
    
    	$("#testhide").hide();
  });
});



