/*
This script is powered by Tzine & Google
http://tutorialzine.com/2010/09/google-powered-site-search-ajax-jquery/
*/
$(document).ready(function(){function c(a){a=$.extend({},d,a);a.term=a.term||$("#s").val();if(a.searchSite)a.term="site:"+a.siteURL+" "+a.term;var b="http://ajax.googleapis.com/ajax/services/search/"+a.type+"?v=1.0&callback=?",e=$("#home-content");$("#home-content").css("visibility","hidden");jQuery("#home-content").ajaxLoader();scrollDownTo("#home-content");$.getJSON(b,{q:a.term,rsz:a.perPage,start:a.page*a.perPage},function(h){var f=h.responseData.results;$("#more").remove();if(f.length){for(var i= $("<div>",{id:"home-content"}),g=0;g<f.length;g++)i.append(new j(f[g])+"");a.append||e.empty();i.append('<div class="clear"></div>').hide().appendTo(e).fadeIn("slow");jQuery("#home-content").ajaxLoaderRemove();$("#home-content").css("visibility","visible");if(+h.responseData.cursor.estimatedResultCount>(a.page+1)*a.perPage){$("#home-content").append('<img class="center" src="images/horizontal-divider.png" width="605" height="23" alt="" />');$("<div>",{id:"more"}).appendTo(e).click(function(){c({append:true, page:a.page+1});$(this).fadeOut()})}}else{jQuery("#home-content").ajaxLoaderRemove();e.empty();$("#home-content").css("visibility","visible");$("#home-content").css({"text-align":"center",height:"300px"});$("#home-content").append('<img src="images/404.png" class="center" alt="Error 404: Page Not Found" /><br />');$("#home-content").append('<p align="center"> No Results Were Found!</p>')}})}function j(a){var b=[];switch(a.GsearchResultClass){case "GwebSearch":b=['<div class="webResult">','<h2><a href="', a.unescapedUrl,'" target="_blank">',a.title,"</a></h2>","<p>",a.content,"</p>",'<a href="',a.unescapedUrl,'" target="_blank">',a.visibleUrl,"</a>","</div>"];break;case "GimageSearch":b=['<div class="imageResult">','<a target="_blank" href="',a.unescapedUrl,'" title="',a.titleNoFormatting,'" class="pic" style="width:',a.tbWidth,"px;height:",a.tbHeight,'px;">','<img src="',a.tbUrl,'" width="',a.tbWidth,'" height="',a.tbHeight,'" /></a>','<div class="clear"></div>','<a href="',a.originalContextUrl,'" target="_blank">', a.visibleUrl,"</a>","</div>"];break;case "GvideoSearch":b=['<div class="imageResult">','<a target="_blank" href="',a.url,'" title="',a.titleNoFormatting,'" class="pic" style="width:150px;height:auto;">','<img src="',a.tbUrl,'" width="100%" /></a>','<div class="clear"></div>','<a href="',a.originalContextUrl,'" target="_blank">',a.publisher,"</a>","</div>"];break;case "GnewsSearch":b=['<div class="webResult">','<h2><a href="',a.unescapedUrl,'" target="_blank">',a.title,"</a></h2>","<p>",a.content, "</p>",'<a href="',a.unescapedUrl,'" target="_blank">',a.publisher,"</a>","</div>"]}this.toString=function(){return b.join("")}}var d={siteURL:"perfectiontools.com",searchSite:true,type:"web",append:false,perPage:8,page:0},k=$("<span>",{className:"arrow"}).appendTo("ul.icons");$("ul.icons li").click(function(){var a=$(this);if(a.hasClass("active"))return false;a.siblings().removeClass("active");a.addClass("active");k.stop().animate({left:a.position().left,marginLeft:a.width()/2-4});d.type=a.attr("data-searchType"); $("#more").fadeOut()});$("#siteNameLabel").append(" "+d.siteURL);$("#searchSite").click();$("li.web").click();$("#s").focus();$("#searchForm").submit(function(){c();return false});$("#searchSite,#searchWeb").change(function(){d.searchSite=this.id=="searchSite"})});function scrollDownTo(c){$.browser.opera?$("html").animate({scrollTop:$(c).offset().top},2E3):$("html,body").animate({scrollTop:$(c).offset().top},2E3)};