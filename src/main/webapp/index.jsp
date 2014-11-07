<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
    String path = request.getContextPath();
			String basePath = request.getScheme() + "://"
					+ request.getServerName() + ":" + request.getServerPort()
					+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'index.jsp' starting page</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="Bananac">
<jsp:include page="common/init.jsp"></jsp:include>
</head>

<body class="easyui-layout">
    <div data-options="region:'north',border:false,href:'view/north-toolbar.jsp'" style="height:50px;"></div>
    <div data-options="region:'west',title:'导航',border:false,href:'view/west-content.jsp'" style="width: 200px;"></div>
    <div id="main_content" class="easyui-tabs" data-options="region:'center'" style="height: 100%; width: 100%;">

    </div>

    <div id="rcmenu" class="easyui-menu" style="">
        <div id="closecur">关闭</div>
        <div id="closeall">关闭全部</div>
        <div id="closeother">关闭其他</div>
        <div class="menu-sep"></div>
        <div id="closeright">关闭右侧标签页</div>
        <div id="closeleft">关闭左侧标签页</div>
    </div>

<script type="text/javascript">
    $(function() {
        $(".tabs-header").bind('contextmenu', function(e) {
            e.preventDefault();
            $('#rcmenu').menu('show', {
                left : e.pageX,
                top : e.pageY
            });
        });
        //关闭当前标签页
        $("#closecur").bind("click",function() {
                    var tab = $('#main_content').tabs('getSelected');
                    var index = $('#main_content').tabs('getTabIndex', tab);
                    $('#main_content').tabs('close', index);
                });
        //关闭所有标签页
        $("#closeall").bind("click", function() {
            var tablist = $('#main_content').tabs('tabs');
            for ( var i = tablist.length - 1; i >= 0; i--) {
                $('#main_content').tabs('close', i);
            }
        });
        //关闭非当前标签页（先关闭右侧，再关闭左侧）
        $("#closeother").bind("click",function() {
                var tablist = $('#main_content').tabs('tabs');
                var tab = $('#main_content').tabs('getSelected');
                var index = $('#main_content').tabs('getTabIndex', tab);
                for ( var i = tablist.length - 1; i > index; i--) {
                    $('#main_content').tabs('close', i);
                }
                var num = index - 1;
                for ( var i = num; i >= 0; i--) {
                    $('#main_content').tabs('close', 0);
                }
            });
        //关闭当前标签页右侧标签页
        $("#closeright").bind(
            "click",function() {
                var tablist = $('#main_content').tabs('tabs');
                var tab = $('#main_content').tabs('getSelected');
                var index = $('#main_content').tabs('getTabIndex', tab);
                for ( var i = tablist.length - 1; i > index; i--) {
                    $('#main_content').tabs('close', i);
                }
            });
        //关闭当前标签页左侧标签页
        $("#closeleft").bind("click",function() {
            var tab = $('#main_content').tabs('getSelected');
            var index = $('#main_content').tabs('getTabIndex', tab);
            var num = index - 1;
            for ( var i = 0; i <= num; i++) {
                $('#main_content').tabs('close', 0);
            }
        });
    });
</script>

</body>

</html>

