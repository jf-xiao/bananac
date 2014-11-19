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

/**
 * 表单序列化, 需要传入一个form的jquery对象，如果表单有填写才收集
 * 用法：serializeObject($("#dic_search_form"))
 */
serializeObject = function(form) {
    var o = {};
    $.each(form.serializeArray(), function(index) {
        if (o[this['name']]) {
            if(this['value']){//如果表单有填写
                o[this['name']] = o[this['name']] + "," + this['value'];
            }
        } else {
            if(this['value']){//如果表单有填写
                o[this['name']] = this['value'];
            }
        }
    });
    return o;
};

//easyui排序方法
function sorter(a1,b1){  
    var a = a1.split('/');  
    var b = b1.split('/');  
    if (a[2] == b[2]){  
        if (a[0] == b[0]){  
            return (a[1]>b[1]?1:-1);  
        } else {  
            return (a[0]>b[0]?1:-1);  
        }  
    } else {  
        return (a[2]>b[2]?1:-1);  
    }  
}