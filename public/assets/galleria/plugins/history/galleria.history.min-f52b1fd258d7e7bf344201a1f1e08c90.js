/*
 Galleria History Plugin 2011-08-01
 http://galleria.aino.se

 Copyright 2011, Aino
 Licensed under the MIT license.

*/
Galleria.requires(1.25,"The History Plugin requires Galleria version 1.2.5 or later."),function(a,b){Galleria.History=function(){var d=[],f=!1,g=b.location,h=b.document,i=Galleria.IE,j="onhashchange"in b&&(h.mode===void 0||h.mode>7),k,l=function(a){return a=k&&!j&&Galleria.IE?a||k.location:g,parseInt(a.hash.substr(2),10)},m=l(g),n=[],o=function(){a.each(n,function(a,d){d.call(b,l())})},p=function(){a.each(d,function(a,b){b()}),f=!0};return j&&i<8&&(j=!1),j?p():a(function(){b.setInterval(function(){var a=l();!isNaN(a)&&a!=m&&(m=a,g.hash="/"+a,o())},50),i?a('<iframe tabindex="-1" title="empty">').hide().attr("src","about:blank").one("load",function(){k=this.contentWindow,p()}).insertAfter(h.body):p()}),{change:function(a){n.push(a),j&&(b.onhashchange=o)},set:function(a){isNaN(a)||(!j&&i&&this.ready(function(){var b=k.document;b.open(),b.close(),k.location.hash="/"+a}),g.hash="/"+a)},ready:function(a){f?a():d.push(a)}}}()}(jQuery,this)