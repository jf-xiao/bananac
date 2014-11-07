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
	<div
		data-options="region:'north',border:false,href:'view/north-toolbar.jsp'"
		style="height:50px;"></div>
	<div
        data-options="region:'west',border:false,href:'view/west-content.jsp'"
        style="width: 200px;"></div>
	<div
		data-options="region:'east',split:true,collapsed:true,title:'East'"
		style="width:100px;padding:10px;">east region</div>
	<div data-options="region:'south',border:false"
		style="height:150px;background:#A9FACD;">south region</div>
	<div id="main_content" class="easyui-tabs" data-options="region:'center'" style="height: 100%; width: 100%;">
	   
	</div>

	<script type="text/javascript">
		$(document).ready(function() {
		});
	</script>
</body>
</html>
