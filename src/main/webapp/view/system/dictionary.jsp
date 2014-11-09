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

<title>My JSP 'dictionary.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

</head>

<body>
    <table>
        <tr>
            <td style="width: 450px;">
                <table class="easyui-datagrid" title="字典目录"
                    data-options="fitColumns:true,onRowContextMenu: onRowContextMenu,pagination:true,rownumbers:true,singleSelect:true,
                    collapsible:true,url:'view/system/data/dictionary.json'">

                    <thead>
                        <tr>
                            <th data-options="field:'名称'">名称</th>
                            <th data-options="field:'编码'">编码</th>
                            <th data-options="field:'是否启用'">是否启用</th>
                            <th data-options="field:'备注'">备注</th>
                        </tr>
                    </thead>
                </table>
            </td>
            <td style="width: 500px;">
                <table class="easyui-datagrid" title="字典明细" style="width:100%;"
                    data-options="pagination:true,rownumbers:true,singleSelect:true,
                        collapsible:true,url:'view/system/data/dictionary.json'">

                    <thead>
                        <tr>
                            <th data-options="field:'名称'">名称</th>
                            <th data-options="field:'编码'">编码</th>
                            <th data-options="field:'是否启用'">是否启用</th>
                            <th data-options="field:'备注'">备注</th>
                        </tr>
                    </thead>
                </table>
            </td>
        </tr>
    </table>
    <div id="dictionary_searchtool" style="padding:10px">
        <form id="dictionary_search_form">
            <table>
                <tr>
                    <td>名称</td>
                    <td><input name="name" class="easyui-textbox" data-options="prompt:'名称',validType:'email'">
                    </td>
                    <td>编码</td>
                    <td><input name="code" class="easyui-textbox" data-options="prompt:'编码',validType:'email'">
                    </td>
                </tr>
                <tr>
                    <td>状态</td>
                    <td><input name="enabled" value="1" type="radio">启用<input value="0" name="enabled" type="radio">停用</td>
                </tr>
            </table>
        </form>
        <div>

        <!-- 数据字典查询条件右键 -->
        <div id="dictionary_searchtool_rcmenu" class="easyui-menu" style="">
            <div id="dic_search_btn">查询</div>
            <div id="dic_reset_btn">重置</div>
        </div>
        <!-- 数据字典右键 -->
        <div id="dictionary_dg_rcmenu" class="easyui-menu" style="">
            <div id="">新增</div>
            <div id="">修改</div>
            <div id="">删除</div>
        </div>

<script type="text/javascript">
    $(function(){
        $("#dictionary_searchtool").bind('contextmenu', function(e) {
            e.preventDefault();
            $('#dictionary_searchtool_rcmenu').menu('show', {
                left : e.pageX,
                top : e.pageY
            });
            
            return false;
        });
        
        
        $('#dic_search_btn').bind('click',function(){
            var params = $('#dictionary_search_form').serializeObject();
            $.post("add.html",params,function(data, textStatus, jqXHR){
                console.info("ssss");
            },'json');
        });
        
        $('#dic_reset_btn').bind('click',function(){
            $("#dictionary_search_form")[0].reset();
        });
    });
    
    function onRowContextMenu(e){
        e.preventDefault();
        $('#dictionary_dg_rcmenu').menu('show', {
            left : e.pageX,
            top : e.pageY
        });
        
        return false;
    }
    
</script>
</body>
</html>
