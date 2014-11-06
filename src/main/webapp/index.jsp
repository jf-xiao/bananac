<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
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
<meta http-equiv="description" content="This is my page">

<link rel="stylesheet" type="text/css" href="js/easyui1.4.1/locale/easyui-lang-zh_CN.js">
<link rel="stylesheet" type="text/css" href="js/easyui1.4.1/themes/bootstrap/easyui.css">
<script type="text/javascript" src="js/easyui1.4.1/jquery.min.js"></script>
<script type="text/javascript" src="js/easyui1.4.1/jquery.easyui.min.js"></script>
</head>

<body>
    <h2>Auto Height for Tabs</h2>
    <p>The tabs height is auto adjusted according to tab panel content.</p>
    <div style="margin:20px 0;"></div>
    <div class="easyui-tabs" style="width:700px;height:auto">
        <div title="About" style="padding:10px">
            <p style="font-size:14px">jQuery EasyUI framework helps you build your web pages easily.</p>
            <ul>
                <li>easyui is a collection of user-interface plugin based on jQuery.</li>
                <li>easyui provides essential functionality for building modem, interactive, javascript
                    applications.</li>
                <li>using easyui you don't need to write many javascript code, you usually defines user-interface
                    by writing some HTML markup.</li>
                <li>complete framework for HTML5 web page.</li>
                <li>easyui save your time and scales while developing your products.</li>
                <li>easyui is very easy but powerful.</li>
            </ul>
        </div>
        <div title="My Documents" style="padding:10px">
            <ul class="easyui-tree" data-options="url:'tree_data1.json',method:'get',animate:true"></ul>
        </div>
        <div title="Help" data-options="iconCls:'icon-help',closable:true" style="padding:10px">This is the help
            content.</div>
    </div>
</body>
</html>
