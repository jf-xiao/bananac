/**
 * @requires jQuery,EasyUI
 * 防止panel/window/dialog组件超出浏览器边界
 * @param left
 * @param top
 */
var easyuiPanelOnMove = function(left, top) {
	var l = left;
	var t = top;
	if (l < 1) {
		l = 1;
	}
	if (t < 1) {
		t = 1;
	}
	var width = parseInt($(this).parent().css('width')) + 14;
	var height = parseInt($(this).parent().css('height')) + 14;
	var right = l + width;
	var buttom = t + height;
	var browserWidth = $(window).width();
	var browserHeight = $(window).height();
	if (right > browserWidth) {
		l = browserWidth - width;
	}
	if (buttom > browserHeight) {
		t = browserHeight - height;
	}
	$(this).parent().css({/* 修正面板位置 */
		left : l,
		top : t
	});
};
$.fn.dialog.defaults.onMove = easyuiPanelOnMove;
$.fn.window.defaults.onMove = easyuiPanelOnMove;
$.fn.panel.defaults.onMove = easyuiPanelOnMove;

//将表单的值序列化成json对象
$.fn.serializeObject = function()    
        {    
           var o = {};    
           var a = this.serializeArray();    
           $.each(a, function() {    
               if (o[this.name]) {    
                   if (!o[this.name].push) {    
                       o[this.name] = [o[this.name]];    
                   }    
                   o[this.name].push(this.value || '');    
               } else {    
                   o[this.name] = this.value || '';    
               }    
           });    
           return o;    
        };