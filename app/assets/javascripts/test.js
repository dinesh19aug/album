$(document).ready(function(){
    $(".myform").bind("ajax:loading",function(evt,xhr,settings){
       var $ent=$(this);
       $ent.find(("div.yes")).hide(100);

    }
    }
);