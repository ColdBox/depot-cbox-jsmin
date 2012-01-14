function doFormEvent(e,targetID,frm){var params={};for(i=0;i<frm.length;i++){if(!(frm[i].type=="radio"&&!frm[i].checked)&&frm[i].value!=undefined){params[frm[i].name]=frm[i].value;}}
doEvent(e,targetID,params,"POST");}
function doEvent(route,targetID,params,methodType,onComplete){var pars="";var methodType=(methodType==null)?"GET":methodType;var onComplete=(onComplete==null)?global_onComplete:onComplete;for(p in params)pars=pars+p+"="+escape(params[p])+"&";$.ajax({type:methodType,url:route,dataType:"html",data:pars,error:global_onError,complete:onComplete,success:function(req){$("#"+targetID).html(req)}});}
function global_onComplete(){}
function global_onError(request){alert('Sorry. An error ocurred while calling a server side component. Please try again.');}
function checkAll(checked,id){$("input[@name='"+id+"']").each(function(){this.checked=checked;});}
var confirmDialog=$('<div><p id="message" class"align-center"></p><p class="align-right"><input type="button" id="yes" value="yes" /> <input type="button" class="modalClose" id="no" value="no" /></p></div>');function confirm(msg,callback)
{confirmDialog.clone().modal({close:true,containerId:"modalConfirmContainer",onShow:function(dialog)
{dialog.data.find("#message").append(msg);var yes=dialog.data.find("#yes");var no=dialog.data.find("#no");yes.click(function(){if($.isFunction(callback)){callback.call();}
$.modal.close();});no.click(function(){$.modal.close();});}});return false;}
function gotoLink(alink)
{window.location.href=$(alink).attr("href");}