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

<title>模块管理</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="">

</head>

<body>
	<h2>Editable TreeGrid</h2>
	<p>Select one node and click edit button to perform editing.</p>
	<div style="margin:20px 0;">
		<a href="javascript:void(0)" class="easyui-linkbutton" onclick="edit()">Edit</a>
		<a href="javascript:void(0)" class="easyui-linkbutton" onclick="save()">Save</a>
		<a href="javascript:void(0)" class="easyui-linkbutton" onclick="cancel()">Cancel</a>
	</div>
	<table id="tg" class="easyui-treegrid" style="width:700px;height:250px"
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
		showFooter: true
		">
	<thead>
		<tr>
			<th data-options="field:'name',width:180">名称</th>
			<th data-options="field:'code',width:60">编码</th>
			<th data-options="field:'url',width:80">URL</th>
			<th data-options="field:'enabled',width:80">状态</th>
		</tr>
	</thead>
	</table>
	<script type="text/javascript">
		function formatProgress(value){
				if (value){
					var s = '<div style="width:100%;border:1px solid #ccc">' +
					'<div style="width:' + value + '%;background:#cc0000;color:#fff">' + value + '%' + '</div>'
					'</div>';
					return s;
				} else {
					return '';
				}
			}
			var editingId;
			function edit(){
				if (editingId != undefined){
				$('#tg').treegrid('select', editingId);
				return;
			}
			var row = $('#tg').treegrid('getSelected');
			if (row){
				editingId = row.id
				$('#tg').treegrid('beginEdit', editingId);
			}
		}
		function save(){
			if (editingId != undefined){
					var t = $('#tg');
					t.treegrid('endEdit', editingId);
					editingId = undefined;
					var persons = 0;
					var rows = t.treegrid('getChildren');
					for(var i=0; i<rows.length; i++){
						 p = parseInt(rows[i].persons);
						if (!isNaN(p)){
							persons += p;
						}
					}
					var frow = t.treegrid('getFooterRows')[0];
					frow.persons = persons;
					t.treegrid('reloadFooter');
			}
		}
		function cancel(){
			if (editingId != undefined){
				$('#tg').treegrid('cancelEdit', editingId);
				editingId = undefined;
			}
		}
	</script>
	 
	</body>
</html>
