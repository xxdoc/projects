/****************************************************************
 *  JQuery Curvy Corners by Mike Jolley                         *
 *  http://blue-anvil.com                                       *
 *  http://code.google.com/p/jquerycurvycorners/                *
 *  ==========================================================  */
(function(c){function x(e){this.selectorText=e;this.tlR=this.trR=this.blR=this.brR=0;this.tlu=this.tru=this.blu=this.bru="";this.antiAlias=true}x.prototype.setcorner=function(e,f,m,i){if(e){propname=e.charAt(0)+f.charAt(0);this[propname+"R"]=parseInt(m);this[propname+"u"]=i}else{this.tlR=this.trR=this.blR=this.brR=parseInt(m);this.tlu=this.tru=this.blu=this.bru=i}};x.prototype.get=function(e){if(/^(t|b)(l|r)(R|u)$/.test(e))return this[e];if(/^(t|b)(l|r)Ru$/.test(e)){e=e.charAt(0)+e.charAt(1);return this[e+
"R"]+this[e+"u"]}if(/^(t|b)Ru?$/.test(e)){var f=e.charAt(0);f+=this[f+"lR"]>this[f+"rR"]?"l":"r";f=this[f+"R"];if(e.length===3&&e.charAt(2)==="u")f+=this.u;return f}throw Error("Don't recognize property "+e);};x.prototype.radiusdiff=function(e){if(e!=="t"&&e!=="b")throw Error("Param must be 't' or 'b'");return Math.abs(this[e+"lR"]-this[e+"rR"])};x.prototype.setfrom=function(e){this.tlu=this.tru=this.blu=this.bru="px";if("tl"in e)this.tlR=e.tl.radius;if("tr"in e)this.trR=e.tr.radius;if("bl"in e)this.blR=
e.bl.radius;if("br"in e)this.brR=e.br.radius;if("antiAlias"in e)this.antiAlias=e.antiAlias};x.prototype.cloneOn=function(e){var f=["tl","tr","bl","br"],m=0,i,v;for(i in f)if(!isNaN(i)){v=this[f[i]+"u"];if(v!==""&&v!=="px"){m=new x;break}}if(m){var A,R,S=curvyBrowser.get_style(e,"left");for(i in f)if(!isNaN(i)){A=f[i];v=this[A+"u"];R=this[A+"R"];if(v!=="px"){S=e.style.left;e.style.left=R+v;R=e.style.pixelLeft;e.style.left=S}m[A+"R"]=R;m[A+"u"]="px"}e.style.left=S}else m=this;return m};x.prototype.radiusSum=
function(e){if(e!=="t"&&e!=="b")throw Error("Param must be 't' or 'b'");return this[e+"lR"]+this[e+"rR"]};x.prototype.radiusCount=function(e){var f=0;this[e+"lR"]&&++f;this[e+"rR"]&&++f;return f};x.prototype.cornerNames=function(){var e=[];this.tlR&&e.push("tl");this.trR&&e.push("tr");this.blR&&e.push("bl");this.brR&&e.push("br");return e};if(typeof redrawList==="undefined")redrawList=[];c.fn.corner=function(e){function f(a,g){this.box=g;this.settings=a;var b=c(this.box);this.masterCorners=[];this.topContainer=
this.bottomContainer=this.shell=null;var d=b.innerWidth();if(b.is("table"))throw Error("You cannot apply corners to "+this.box.tagName+" elements.","Error");b.css("display")==="inline"&&b.css("display","inline-block");if(d){if(a instanceof x)this.spec=a.cloneOn(this.box);else{this.spec=new x("");this.spec.setfrom(this.settings)}var h=b.css("borderTopWidth")?b.css("borderTopWidth"):0,n=b.css("borderBottomWidth")?b.css("borderBottomWidth"):0,s=b.css("borderLeftWidth")?b.css("borderLeftWidth"):0,o=b.css("borderRightWidth")?
b.css("borderRightWidth"):0,k=b.css("borderTopColor"),$=b.css("borderBottomColor"),aa=b.css("borderLeftColor"),ba=b.css("borderRightColor"),ca=b.css("borderTopStyle"),da=b.css("borderBottomStyle"),ea=b.css("borderLeftStyle"),fa=b.css("borderRightStyle"),Z=b.css("backgroundColor"),W=b.css("backgroundImage"),ga=b.css("backgroundRepeat"),C,D;C=b.css("backgroundPositionX")?b.css("backgroundPositionX"):0;D=b.css("backgroundPositionY")?b.css("backgroundPositionY"):0;var J=b.css("position"),ha=b.css("paddingTop"),
ia=b.css("paddingBottom"),ja=b.css("paddingLeft"),ka=b.css("paddingRight");b.css("border");var N=jQuery.browser.version>7&&c.browser.msie?b.css("filter"):null,I=this.spec.get("tR"),K=this.spec.get("bR"),B=function(t){if(typeof t==="number")return t;if(typeof t!=="string")throw Error("unexpected styleToNPx type "+typeof t);var E=/^[-\d.]([a-z]+)$/.exec(t);if(E&&E[1]!="px")throw Error("Unexpected unit "+E[1]);if(isNaN(t=parseInt(t)))t=0;return t};try{this.borderWidth=B(h);this.borderWidthB=B(n);this.borderWidthL=
B(s);this.borderWidthR=B(o);this.boxColour=f.format_colour(Z);this.topPadding=B(ha);this.bottomPadding=B(ia);this.leftPadding=B(ja);this.rightPadding=B(ka);this.boxWidth=d;this.boxHeight=b.innerHeight();this.borderColour=f.format_colour(k);this.borderColourB=f.format_colour($);this.borderColourL=f.format_colour(aa);this.borderColourR=f.format_colour(ba);this.borderString=this.borderWidth+"px "+ca+" "+this.borderColour;this.borderStringB=this.borderWidthB+"px "+da+" "+this.borderColourB;this.borderStringL=
this.borderWidthL+"px "+ea+" "+this.borderColourL;this.borderStringR=this.borderWidthR+"px "+fa+" "+this.borderColourR;this.backgroundImage=W!="none"&&W!="initial"?W:"";this.backgroundRepeat=ga}catch(la){}var L=this.boxHeight,M=d;if(c.browser.opera){C=B(C);D=B(D);if(C){d=M+this.borderWidthL+this.borderWidthR;if(C>d)C=d;C=d/C*100+"%"}if(D){d=L+this.borderWidth+this.borderWidthB;if(D>d)D=d;D=d/D*100+"%"}}this.contentContainer=document.createElement("div");if(N)this.contentContainer.style.filter=N;for(;this.box.firstChild;)this.contentContainer.appendChild(this.box.removeChild(this.box.firstChild));
J!="absolute"&&b.css("position","relative");this.box.style.padding="0";this.box.style.border=this.box.style.backgroundImage="none";this.box.style.backgroundColor="transparent";this.box.style.width=M+this.borderWidthL+this.borderWidthR+"px";this.box.style.height=L+this.borderWidth+this.borderWidthB+"px";J=document.createElement("div");c(J).css({width:M+"px",padding:"0",position:"absolute",height:L+this.borderWidth+this.borderWidthB-I-K<=0?"0":L+this.borderWidth+this.borderWidthB-I-K+"px",top:I+"px",
left:"0",backgroundColor:Z,backgroundImage:this.backgroundImage,backgroundRepeat:this.backgroundRepeat,direction:"ltr"});N&&c(J).css("filter","filter");this.borderWidthL&&c(J).css("borderLeft",this.borderStringL);this.borderWidth&&!I&&c(J).css("borderTop",this.borderString);this.borderWidthR&&c(J).css("borderRight",this.borderStringR);this.borderWidthB&&!K&&c(J).css("borderBottom",this.borderStringB);this.shell=this.box.appendChild(J);d=c(this.shell).css("width");if(d===""||d==="auto"||d.indexOf("%")!==
-1)throw Error("Shell width is "+d);this.boxWidth=d!=""&&d!="auto"&&d.indexOf("%")==-1?parseInt(d):c(this.shell).width();this.applyCorners=function(){this.backgroundPosX=this.backgroundPosY=0;if(this.backgroundObject){var t=function(O,X,Y){if(O===0)return 0;if(O==="right"||O==="bottom")return Y-X;if(O==="center")return(Y-X)/2;if(O.indexOf("%")>0)return(Y-X)/(100/parseInt(O));return B(O)};this.backgroundPosX=t(C,this.backgroundObject.width,M);this.backgroundPosY=t(D,this.backgroundObject.height,L)}else if(this.backgroundImage){this.backgroundPosX=
B(C);this.backgroundPosY=B(D)}if(I){t=document.createElement("div");c(t).css({width:this.boxWidth+"px",fontSize:"1px",overflow:"hidden",position:"absolute",paddingLeft:this.borderWidth+"px",paddingRight:this.borderWidth+"px",height:I+"px",top:-I+"px",left:-this.borderWidthL+"px"});this.topContainer=this.shell.appendChild(t)}if(K){t=document.createElement("div");c(t).css({width:this.boxWidth+"px",fontSize:"1px",overflow:"hidden",position:"absolute",paddingLeft:this.borderWidthB+"px",paddingRight:this.borderWidthB+
"px",height:K+"px",bottom:-K+"px",left:-this.borderWidthL+"px"});this.bottomContainer=this.shell.appendChild(t)}t=this.spec.cornerNames();for(var E in t)if(!isNaN(E)){var G=t[E],p=this.spec[G+"R"],F,H,w;if(G=="tr"||G=="tl"){F=this.borderColour;w=this.borderWidth}else{F=this.borderColourB;w=this.borderWidthB}H=p-w;var q=document.createElement("div");c(q).css({position:"absolute","font-size":"1px",overflow:"hidden"}).height(this.spec.get(G+"Ru")).width(this.spec.get(G+"Ru"));var l,j,P,y=N?parseInt(/alpha\(opacity.(\d+)\)/.exec(N)[1]):
100;for(l=0;l<p;++l){var Q=l+1>=H?-1:Math.floor(Math.sqrt(Math.pow(H,2)-Math.pow(l+1,2)))-1;if(H!=p)var u=l>=H?-1:Math.ceil(Math.sqrt(Math.pow(H,2)-Math.pow(l,2))),T=l+1>=p?-1:Math.floor(Math.sqrt(Math.pow(p,2)-Math.pow(l+1,2)))-1;var U=l>=p?-1:Math.ceil(Math.sqrt(Math.pow(p,2)-Math.pow(l,2)));Q>-1&&this.drawPixel(l,0,this.boxColour,y,Q+1,q,true,p);if(H!=p)if(this.spec.antiAlias){for(j=Q+1;j<u;++j)if(this.backgroundImage!=""){P=f.pixelFraction(l,j,H)*100;this.drawPixel(l,j,F,y,1,q,P>=30,p)}else if(this.boxColour!==
"transparent"){P=f.BlendColour(this.boxColour,F,f.pixelFraction(l,j,H));this.drawPixel(l,j,P,y,1,q,false,p)}else this.drawPixel(l,j,F,y>>1,1,q,false,p);if(T>=u){if(u==-1)u=0;this.drawPixel(l,u,F,y,T-u+1,q,false,0)}P=F;j=T}else T>Q&&this.drawPixel(l,Q+1,F,y,T-Q,q,false,0);else{P=this.boxColour;j=Q}if(this.spec.antiAlias&&this.boxColour!=="transparent")for(;++j<U;)this.drawPixel(l,j,P,f.pixelFraction(l,j,p)*y,1,q,w<=0,p)}F=0;for(H=q.childNodes.length;F<H;++F){w=q.childNodes[F];l=parseInt(c(w).css("top"));
y=parseInt(c(w).css("left"));U=parseInt(c(w).css("height"));if(G=="tl"||G=="bl")c(w).css("left",p-y-1+"px");if(G=="tr"||G=="tl")c(w).css("top",p-U-l+"px");c(w).css("backgroundRepeat",this.backgroundRepeat);if(this.backgroundImage)switch(G){case "tr":c(w).css("backgroundPosition",this.backgroundPosX-this.borderWidthL+p-M-y+"px "+(this.backgroundPosY+U+l+this.borderWidth-p)+"px");break;case "tl":c(w).css("backgroundPosition",this.backgroundPosX-p+y+1+this.borderWidthL+"px "+(this.backgroundPosY-p+U+
l+this.borderWidth)+"px");break;case "bl":c(w).css("backgroundPosition",this.backgroundPosX-p+y+1+this.borderWidthL+"px "+(this.backgroundPosY-L-this.borderWidth+(!jQuery.support.boxModel?l:-l)+p)+"px");break;case "br":jQuery.support.boxModel?c(w).css("backgroundPosition",this.backgroundPosX-this.borderWidthL-M+p-y+"px "+(this.backgroundPosY-L-this.borderWidth+p-l)+"px"):c(w).css("backgroundPosition",this.backgroundPosX-this.borderWidthL-M+p-y+"px "+(this.backgroundPosY-L-this.borderWidth+l+p)+"px")}}switch(G){case "tl":c(q).css("top",
q.style.left="0");this.topContainer.appendChild(q);break;case "tr":c(q).css("top",q.style.right="0");this.topContainer.appendChild(q);break;case "bl":c(q).css("bottom",q.style.left="0");this.bottomContainer.appendChild(q);break;case "br":c(q).css("bottom",q.style.right="0");this.bottomContainer.appendChild(q)}}E={t:this.spec.radiusdiff("t"),b:this.spec.radiusdiff("b")};for(z in E)if(typeof z!=="function")if(this.spec.get(z+"R")){if(E[z]){j=this.spec[z+"lR"]<this.spec[z+"rR"]?z+"l":z+"r";u=document.createElement("div");
c(u).css({height:E[z]+"px",width:this.spec.get(j+"Ru"),position:"absolute",fontSize:"1px",overflow:"hidden",backgroundColor:this.boxColour,backgroundImage:this.backgroundImage,backgroundRepeat:this.backgroundRepeat});N&&c(u).css("filter","filter");switch(j){case "tl":c(u).css({bottom:"",left:"0",borderLeft:this.borderStringL,backgroundPosition:this.backgroundPosX+"px "+(this.borderWidth+this.backgroundPosY-this.spec.tlR)+"px"});this.topContainer.appendChild(u);break;case "tr":c(u).css({bottom:"",
right:"0",borderRight:this.borderStringR,backgroundPosition:this.backgroundPosX-this.boxWidth+this.spec.trR+"px "+(this.borderWidth+this.backgroundPosY-this.spec.trR)+"px"});this.topContainer.appendChild(u);break;case "bl":c(u).css({top:"",left:"0",borderLeft:this.borderStringL,backgroundPosition:this.backgroundPosX+"px "+(this.backgroundPosY-this.borderWidth-this.boxHeight+E[z]+this.spec.blR)+"px"});this.bottomContainer.appendChild(u);break;case "br":c(u).css({top:"",right:"0",borderRight:this.borderStringR,
backgroundPosition:this.borderWidthL+this.backgroundPosX-this.boxWidth+this.spec.brR+"px "+(this.backgroundPosY-this.borderWidth-this.boxHeight+E[z]+this.spec.brR)+"px"});this.bottomContainer.appendChild(u)}}j=document.createElement("div");N&&c(j).css("filter","filter");c(j).css({position:"relative",fontSize:"1px",overflow:"hidden",width:this.fillerWidth(z),backgroundColor:this.boxColour,backgroundImage:this.backgroundImage,backgroundRepeat:this.backgroundRepeat});switch(z){case "t":if(this.topContainer){jQuery.support.boxModel?
c(j).css("height",100+I-this.borderWidth+"px"):c(j).css("height",100+I+"px");c(j).css("marginLeft",this.spec.tlR?this.spec.tlR-this.borderWidthL+"px":"0");c(j).css("borderTop",this.borderString);if(this.backgroundImage){u=this.spec.tlR?this.borderWidthL+this.backgroundPosX-this.spec.tlR+"px ":this.backgroundPosX+"px ";c(j).css("backgroundPosition",u+this.backgroundPosY+"px");c(this.shell).css("backgroundPosition",this.backgroundPosX+"px "+(this.backgroundPosY-I+this.borderWidthL)+"px")}this.topContainer.appendChild(j)}break;
case "b":if(this.bottomContainer){jQuery.support.boxModel?c(j).css("height",K-this.borderWidthB+"px"):c(j).css("height",K+"px");c(j).css("marginLeft",this.spec.blR?this.spec.blR-this.borderWidthL+"px":"0");c(j).css("borderBottom",this.borderStringB);if(this.backgroundImage){u=this.spec.blR?this.backgroundPosX+this.borderWidthL-this.spec.blR+"px ":this.backgroundPosX+"px ";c(j).css("backgroundPosition",u+(this.backgroundPosY-L-this.borderWidth+K)+"px")}this.bottomContainer.appendChild(j)}}}z=M;if(jQuery.support.boxModel)z-=
this.leftPadding+this.rightPadding;c(this.contentContainer).css({position:"absolute",left:this.borderWidthL+"px",paddingTop:this.topPadding+"px",top:this.borderWidth+"px",paddingLeft:this.leftPadding+"px",paddingRight:this.rightPadding+"px",width:z+"px",textAlign:b.css("textAlign")}).addClass("autoPadDiv");b.css("textAlign","left").addClass("hasCorners");this.box.appendChild(this.contentContainer)};if(this.backgroundImage){C=this.backgroundCheck(C);D=this.backgroundCheck(D);if(this.backgroundObject){this.backgroundObject.holdingElement=
this;this.dispatch=this.applyCorners;this.applyCorners=function(){if(this.backgroundObject.complete)this.dispatch();else this.backgroundObject.onload=new Function("$(this.holdingElement).dispatch();")}}}}else this.applyCorners=function(){}}var m=false,i,v,A;try{i=document.body.style.WebkitBorderRadius!==undefined}catch(R){}try{v=document.body.style.MozBorderRadius!==undefined}catch(S){}try{A=document.body.style.BorderRadius!==undefined}catch(V){}if(i||v||A)m=true;if(e instanceof x)r=e;else{e=jQuery.extend({tl:{radius:8},
tr:{radius:8},bl:{radius:8},br:{radius:8},antiAlias:true},e);var r=new x(this);r.setfrom(e)}f.prototype.backgroundCheck=function(a){if(a==="top"||a==="left"||parseInt(a)===0)return 0;if(!/^[-\d.]+px$/.test(a)&&!this.backgroundObject){this.backgroundObject=new Image;this.backgroundObject.src=function(g){var b=/url\("?([^'"]+)"?\)/.exec(g);return b?b[1]:g}(this.backgroundImage)}return a};f.prototype.drawPixel=function(a,g,b,d,h,n,s,o){var k=document.createElement("div");c(k).css({height:h+"px",width:"1px",
position:"absolute","font-size":"1px",overflow:"hidden",top:g+"px",left:a+"px","background-color":b});b=this.spec.get("tR");s&&this.backgroundImage!=""&&c(k).css({"background-position":"-"+(this.boxWidth-(o-a)+this.borderWidth)+"px -"+(this.boxHeight+b+g-this.borderWidth)+"px","background-image":this.backgroundImage});d!=100&&c(k).css({opacity:d/100});n.appendChild(k)};f.prototype.fillerWidth=function(a){var g;g=!jQuery.support.boxModel?0:this.spec.radiusCount(a)*this.borderWidthL;if((a=this.boxWidth-
this.spec.radiusSum(a)+g)<0)throw Error("Radius exceeds box width");return a+"px"};f.getComputedColour=function(a){var g=document.createElement("DIV");g.style.backgroundColor=a;document.body.appendChild(g);if(window.getComputedStyle){a=document.defaultView.getComputedStyle(g,null).getPropertyValue("background-color");g.parentNode.removeChild(g);if(a.substr(0,3)==="rgb")a=f.rgb2Hex(a);return a}else{var b=document.body.createTextRange();b.moveToElementText(g);b.execCommand("ForeColor",false,a);a=b.queryCommandValue("ForeColor");
a="rgb("+(a&255)+", "+((a&65280)>>8)+", "+((a&16711680)>>16)+")";g.parentNode.removeChild(g);return f.rgb2Hex(a)}};f.BlendColour=function(a,g,b){if(a==="transparent"||g==="transparent")throw Error("Cannot blend with transparent");if(a.charAt(0)!=="#")a=f.format_colour(a);if(g.charAt(0)!=="#")g=f.format_colour(g);var d=parseInt(a.substr(1,2),16),h=parseInt(a.substr(3,2),16);a=parseInt(a.substr(5,2),16);var n=parseInt(g.substr(1,2),16),s=parseInt(g.substr(3,2),16);g=parseInt(g.substr(5,2),16);if(b>
1||b<0)b=1;d=Math.round(d*b+n*(1-b));if(d>255)d=255;if(d<0)d=0;h=Math.round(h*b+s*(1-b));if(h>255)h=255;if(h<0)h=0;b=Math.round(a*b+g*(1-b));if(b>255)b=255;if(b<0)b=0;return"#"+f.IntToHex(d)+f.IntToHex(h)+f.IntToHex(b)};f.IntToHex=function(a){var g=["0","1","2","3","4","5","6","7","8","9","A","B","C","D","E","F"];return g[a>>>4]+""+g[a&15]};f.pixelFraction=function(a,g,b){b=b*b;var d=Array(2),h=Array(2),n=0,s="",o=Math.sqrt(b-Math.pow(a,2));if(o>=g&&o<g+1){s="Left";d[n]=0;h[n]=o-g;++n}o=Math.sqrt(b-
Math.pow(g+1,2));if(o>=a&&o<a+1){s+="Top";d[n]=o-a;h[n]=1;++n}o=Math.sqrt(b-Math.pow(a+1,2));if(o>=g&&o<g+1){s+="Right";d[n]=1;h[n]=o-g;++n}o=Math.sqrt(b-Math.pow(g,2));if(o>=a&&o<a+1){s+="Bottom";d[n]=o-a;h[n]=0}switch(s){case "LeftRight":a=Math.min(h[0],h[1])+(Math.max(h[0],h[1])-Math.min(h[0],h[1]))/2;break;case "TopRight":a=1-(1-d[0])*(1-h[1])/2;break;case "TopBottom":a=Math.min(d[0],d[1])+(Math.max(d[0],d[1])-Math.min(d[0],d[1]))/2;break;case "LeftBottom":a=h[0]*d[1]/2;break;default:a=1}return a};
f.rgb2Hex=function(a){try{var g=f.rgb2Array(a),b=parseInt(g[0]),d=parseInt(g[1]),h=parseInt(g[2]),n="#"+f.IntToHex(b)+f.IntToHex(d)+f.IntToHex(h)}catch(s){alert("There was an error converting the RGB value to Hexadecimal in function rgb2Hex")}return n};f.rgb2Array=function(a){return a.substring(4,a.indexOf(")")).split(", ")};f.format_colour=function(a){if(a!=""&&a!="transparent")if(a.substr(0,3)==="rgb")a=f.rgb2Hex(a);else if(a.charAt(0)!=="#")a=getComputedColour(a);else if(a.length===4)a="#"+a.charAt(1)+
a.charAt(1)+a.charAt(2)+a.charAt(2)+a.charAt(3)+a.charAt(3);return a};return this.each(function(){if(!c(this).is(".hasCorners"))if(m){r.get("tlR")&&c(this).css({"border-top-left-radius":r.get("tlR")+"px","-moz-border-radius-topleft":r.get("tlR")+"px","-webkit-border-top-left-radius":r.get("tlR")+"px"});r.get("trR")&&c(this).css({"border-top-right-radius":r.get("trR")+"px","-moz-border-radius-topright":r.get("trR")+"px","-webkit-border-top-right-radius":r.get("trR")+"px"});r.get("blR")&&c(this).css({"border-bottom-left-radius":r.get("blR")+
"px","-moz-border-radius-bottomleft":r.get("blR")+"px","-webkit-border-bottom-left-radius":r.get("blR")+"px"});r.get("brR")&&c(this).css({"border-bottom-right-radius":r.get("brR")+"px","-moz-border-radius-bottomright":r.get("brR")+"px","-webkit-border-bottom-right-radius":r.get("brR")+"px"})}else{if(!c(this).is(".drawn")){c(this).addClass("drawn");thestyles=c(this).attr("style");if(thestyles=="undefined")thestyles="";redrawList.push({node:this,spec:r,style:thestyles,copy:c(this).clone(true)})}(new f(r,
this)).applyCorners()}})};c.fn.removeCorners=function(){return this.each(function(e,f){thisdiv=f;c.each(redrawList,function(m,i){if(i.node==thisdiv&&c(".autoPadDiv",thisdiv).size()>0){c(thisdiv).html(c(thisdiv).children(".autoPadDiv:first").contents());style=i.style=="undefined"?i.style:"";c(thisdiv).removeClass("hasCorners").attr("style",style);return false}})})};c.fn.redrawCorners=function(){return this.each(function(e,f){thisdiv=f;c.each(redrawList,function(m,i){if(i.node==thisdiv){c(thisdiv).corner(i.spec);
return false}})})};c.fn.dispatch=function(){return this.each(function(e,f){obj=f;if("dispatch"in obj)obj.dispatch();else throw Error("No dispatch function");})};c(function(){if(c.browser.msie){try{document.execCommand("BackgroundImageCache",false,true)}catch(e){}var f=function(b){if(!parseInt(b))return"px";return/^[\d.]+(\w+)$/.exec(b)[1]},m,i,v,A=function(b){var d=b.style;if(jQuery.browser.version>6){var h=d["-moz-border-radius"]||0,n=d["-moz-border-radius-topright"]||0,s=d["-moz-border-radius-topleft"]||
0,o=d["-moz-border-radius-bottomright"]||0;d=d["-moz-border-radius-bottomleft"]||0}else{h=d["moz-border-radius"]||0;n=d["moz-border-radius-topright"]||0;s=d["moz-border-radius-topleft"]||0;o=d["moz-border-radius-bottomright"]||0;d=d["moz-border-radius-bottomleft"]||0}if(h){var k=h.split("/");k=k[0].split(/\s+/);k[k.length-1]===""&&k.pop();switch(k.length){case 3:s=k[0];n=d=k[1];o=k[2];h=false;break;case 2:s=o=k[0];n=d=k[1];h=false;case 1:break;case 4:s=k[0];n=k[1];o=k[2];d=k[3];h=false;break;default:alert("Illegal corners specification: "+
h)}}if(h||s||n||o||d){k=new x(b.selectorText);if(h)k.setcorner(null,null,parseInt(h),f(h));else{n&&k.setcorner("t","r",parseInt(n),f(n));s&&k.setcorner("t","l",parseInt(s),f(s));d&&k.setcorner("b","l",parseInt(d),f(d));o&&k.setcorner("b","r",parseInt(o),f(o))}c(b.selectorText).corner(k)}};for(m=0;m<document.styleSheets.length;++m)try{if(document.styleSheets[m].imports)for(i=0;i<document.styleSheets[m].imports.length;++i)for(v=0;v<document.styleSheets[m].imports[i].rules.length;++v)A(document.styleSheets[m].imports[i].rules[v]);
for(i=0;i<document.styleSheets[m].rules.length;++i)A(document.styleSheets[m].rules[i])}catch(R){}}else if(c.browser.opera){try{checkStandard=document.body.style.BorderRadius!==undefined}catch(S){}if(!checkStandard){rules=[];for(m=0;m<document.styleSheets.length;++m)if(/border-((top|bottom)-(left|right)-)?radius/.test(document.styleSheets.item(m).ownerNode.text)){v=document.styleSheets.item(sheetnumber).ownerNode.text;v=v.replace(/\/\*(\n|\r|.)*?\*\//g,"");A=RegExp("^\\s*([\\w.#][-\\w.#, ]+)[\\n\\s]*\\{([^}]+border-((top|bottom)-(left|right)-)?radius[^}]*)\\}",
"mg");for(var V;(V=A.exec(v))!==null;)for(var r=RegExp("(..)border-((top|bottom)-(left|right)-)?radius:\\s*([\\d.]+)(in|em|px|ex|pt)","g"),a,g=new x(V[1]);(a=r.exec(V[2]))!==null;){a[1]!=="z-"&&g.setcorner(a[3],a[4],a[5],a[6]);rules.push(g)}}for(i in rules)isNaN(i)||c(rules[i].selectorText).corner(rules[i])}}})})(jQuery);