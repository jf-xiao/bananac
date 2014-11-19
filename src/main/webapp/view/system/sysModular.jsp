<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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

<title>模块管理</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="">

</head>

<body>
    <table id="tg" class="easyui-treegrid" style="width:700px"
        data-options="
		iconCls: 'icon-ok',
		rownumbers: true,
		animate: true,
		collapsible: true,
		fitColumns: true,
		url: 'sysModular/search.html',
		method: 'get',
		idField: 'id',
		treeField: 'name',
		showFooter: true,
        pagination: true
		">
        <thead>
            <tr>
            	<th data-options="field:'ck', checkbox:true"></th>
                <th data-options="field:'name',width:80, sorter:sorter">名称</th>
                <th data-options="field:'code',width:60, sorter:sorter">编码</th>
                <th data-options="field:'url',width:180">URL</th>
                <th data-options="field:'enabled',width:80,formatter:enabledimgbox">状态</th>
            </tr>
        </thead>
    </table>
    <div id="toolbar">
		<a class="easyui-linkbutton" iconCls="icon-add" plain="true"  onclick="add();">添加</a>
		<a class="easyui-linkbutton" iconCls="icon-edit" plain="true"  onclick="edit();">修改</a>
		<a class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="deleteModular();">删除</a>
		<a class="easyui-linkbutton" iconCls="icon-ok" plain="true"  onclick="enabledModular();">启用</a>
		<a class="easyui-linkbutton" iconCls="icon-no" plain="true"  onclick="disabledModular();">停用</a>
		<a class="easyui-linkbutton" iconCls="icon-redo" plain="true"  onclick="cancel();">取消</a>
    </div>

     <div id="w" class="easyui-window" title="新增系统模块" data-options="cache:false,resizable:false,modal:true,closed:true,iconCls:'icon-add'" style="width:500px;height:400px" href="view/system/addSysModular.jsp">

     <div id="updModularWindow" class="easyui-window" title="修改系统模块" data-options="cache:false,resizable:false,modal:true,closed:true,iconCls:'icon-add'" style="width:500px;height:400px" href="view/system/updSysModular.jsp">

</div>


    <script type="text/javascript">
        var editingId = undefined;

        $('#tg').treegrid({
            remoteSort:false,
            singleSelect:false,
            toolbar:'#toolbar'
        });

        function enabledimgbox(cellvalue, options, rowObject){
            return cellvalue == 0 ? '<img src="js/easyui1.4.1/themes/icons/no.png" alt="无效" title="无效" />' : '<img src="js/easyui1.4.1/themes/icons/ok.png" alt="有效" title="有效" />';
        }

        //保存
        function save() {
            if (editingId != undefined) {
            	var $tg = $('#tg');
            	var row = $tg.treegrid('getSelected');
            };
        }
        //修改
        function cancel() {
            if (editingId != undefined) {
                $('#tg').treegrid('cancelEdit', editingId);
                editingId = undefined;
            }
        }
        //添加
        function add(){
        	var rows = $('#tg').treegrid('getSelections');
        	if(rows != undefined && rows.length != 1){
        		$.messager.alert('提示','只能选择一条记录!');
        		return;
        	}
        	$('#w').window('open');
        }

        //双击编辑
        function edit(){
            var rows = $('#tg').treegrid('getSelections');
        	if(rows != undefined && rows.length != 1){
        		$.messager.alert('提示','只能选择一条记录!');
        		return;
        	}
        	$('#updModularWindow').window('open');
        }
        //单击事件
        function onClickRow(row){
        	editingId = row.id;
        	console.info(editingId);
        	$('#tg').treegrid('unselectAll');
        	$('#tg').treegrid('select', editingId);
        }

        //删除
        function deleteModular(){
        	var $tg = $('#tg');
        	var rows = $tg.treegrid('getSelections');
        	if(rows == undefined || rows.length <= 0){
        		$.messager.alert('提示','未选择任何记录!');
        		return;
        	}
        	$.messager.confirm('提示','确定删除,将同时删除所有子模块?',function(r){
        		if (r){
        			var ids = new Array();
		        	for (var i = rows.length - 1; i >= 0; i--) {
		        		ids.push(rows[i].id);
		        	}

		        	$.post("sysModular/delete.html",{
		        		ids : ids.join(',')
		        	},function(data, textStatus, jqXHR){
		        		if(data.success == false){
		        			$.messager.alert('提示','删除失败!');
							return;
		        		}
		        		//删除成功后, 刷新当前页
	        			$tg.treegrid('reload');
	        			$.messager.alert('提示','删除成功!');
		        	},"json");
        		};
        	});
        }

        //启用
        function enabledModular(){
        	var $tg = $('#tg');
        	var rows = $tg.treegrid('getSelections');
        	if(rows == undefined || rows.length <= 0){
        		$.messager.alert('提示','未选择任何记录!');
        		return;
        	}
        	$.messager.confirm('提示','确定启用?',function(r){
        		if (r){
        			var ids = new Array();
		        	for (var i = rows.length - 1; i >= 0; i--) {
		        		ids.push(rows[i].id);
		        	}

		        	$.post("sysModular/enabled.html",{
		        		ids : ids.join(',')
		        	},function(data, textStatus, jqXHR){
		        		if(data.success == false){
		        			$.messager.alert('提示','启用失败!');
							return;
		        		}
		        		//删除成功后, 刷新当前页
	        			$tg.treegrid('reload');
	        			$.messager.alert('提示','启用成功!');
		        	},"json");
        		};
        	});
        }

        //停用
        function disabledModular(){
        	var $tg = $('#tg');
        	var rows = $tg.treegrid('getSelections');
        	if(rows == undefined || rows.length <= 0){
        		$.messager.alert('提示','未选择任何记录!');
        		return;
        	}
        	$.messager.confirm('提示','确定停用?',function(r){
        		if (r){
        			var ids = new Array();
		        	for (var i = rows.length - 1; i >= 0; i--) {
		        		ids.push(rows[i].id);
		        	}

		        	$.post("sysModular/disabled.html",{
		        		ids : ids.join(',')
		        	},function(data, textStatus, jqXHR){
		        		if(data.success == false){
		        			$.messager.alert('提示','停用失败!');
							return;
		        		}
		        		//删除成功后, 刷新当前页
	        			$tg.treegrid('reload');
	        			$.messager.alert('提示','停用成功!');
		        	},"json");
        		};
        	});
        }
    </script>

</body>
</html>
