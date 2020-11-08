if(typeof ClientDependency=='undefined')var ClientDependency={};if(!ClientDependency.Sys)ClientDependency.Sys={};ClientDependency.Sys.LazyLoader=function(){this.addedDependencies=[];this.jsQueue=new Array();this.jsQueueWaiting=false;};ClientDependency.Sys.LazyLoader.prototype.AddJs=function(filePath,callbackMethod){if(this.addedDependencies[filePath]==undefined){var script=new Array();script.filePath=filePath;script.callbackMethod=callbackMethod;script.loaded=false;this.jsQueue[this.jsQueue.length]=script;this.addedDependencies[filePath]=true;if(!this.jsQueueWaiting)
this.LoadNextJs();}
else{}
return this;};ClientDependency.Sys.LazyLoader.prototype.RegisterCallbackMethod=function(callbackMethod){if(callbackMethod==""){return this;}
var script={loaded:false,callbackMethod:callbackMethod};ClientDependency.Sys.onScriptAvailable(script);return this;};function logthis(txt){}
ClientDependency.Sys.LazyLoader.prototype.AddCss=function(filePath){if(this.addedDependencies[filePath]==undefined){var tempCss=document.createElement("link");tempCss.setAttribute("href",filePath);tempCss.setAttribute("rel","stylesheet");tempCss.setAttribute("type","text/css");document.getElementsByTagName("head")[0].appendChild(tempCss);this.addedDependencies[filePath]="loaded";}
else{}
return this;};ClientDependency.Sys.LazyLoader.prototype.LoadNextJs=function(){if(this.jsQueue.length>0){this.jsQueueWaiting=true;var script=this.jsQueue[0];this.jsQueue.splice(0,1);var tempJs=document.createElement('script');tempJs.setAttribute("src",script.filePath);tempJs.setAttribute("type","text/javascript");tempJs.onload=function(){ClientDependency.Sys.onScriptAvailable(script);};tempJs.onreadystatechange=function(){if(this.readyState=='loaded'||this.readyState=='complete'){ClientDependency.Sys.onScriptAvailable(script);}};document.getElementsByTagName("head")[0].appendChild(tempJs);}
else{this.jsQueueWaiting=false;if(typeof jQuery=="undefined")
ClientDependency.Sys.triggerEvent(document,'ClientDependencyDone');else
$(document).trigger("ClientDependencyDone");}};var CDLazyLoader=new ClientDependency.Sys.LazyLoader();ClientDependency.Sys.onScriptAvailable=function(script){if(!script.loaded){script.loaded=true;}
if(typeof jQuery=="undefined")
ClientDependency.Sys.triggerEvent(document,'ClientDependencyLoaded');else
$(document).trigger("ClientDependencyLoaded",script.filePath);if(typeof script.callbackMethod=="undefined"||script.callbackMethod==''){CDLazyLoader.LoadNextJs();}
else{try{eval(script.callbackMethod);}
catch(err){setTimeout(function(){ClientDependency.Sys.onScriptAvailable(script);},50);return;}
if(typeof(eval(script.callbackMethod))=='function'){CDLazyLoader.LoadNextJs();var func=eval(script.callbackMethod);func.call(this);}
else{setTimeout(function(){ClientDependency.Sys.onScriptAvailable(script);},50);}}}
ClientDependency.Sys.triggerEvent=function(el,eventName){var event;if(document.createEvent){event=document.createEvent('HTMLEvents');event.initEvent(eventName,true,true);}else if(document.createEventObject){event=document.createEventObject();event.eventType=eventName;}
event.eventName=eventName;if(el.dispatchEvent){el.dispatchEvent(event);}else if(el[eventName]){el[eventName]();}else if(el['on'+eventName]){el['on'+eventName]();}}
ClientDependency.Sys.addEvent=function(el,type,handler){if(el.addEventListener){el.addEventListener(type,handler,false);}else{el['on'+type]=handler;}}
ClientDependency.Sys.removeEvent=function(el,type,handler){if(el.removeventListener){el.removeEventListener(type,handler,false);}else{el['on'+type]=null;}}