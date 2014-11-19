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

<title>数据字典管理</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="">

</head>

<body>
    <div class="easyui-layout" style="width:900px;height:500px;">
        <div id="dictionary_west" data-options="region:'west',split:true" title="目录" style="width:450px;">
            <table id="dictionary_dg">
                <thead>
                    <tr>
                    	<th data-options="field:'ck', checkbox:true"></th>
                        <th data-options="field:'name', sorter:sorter" width="80"  sortable="true" editor="{type:'validatebox',options:{required:true}}">名称</th>
                        <th data-options="field:'code', sorter:sorter" width="100" sortable="true" editor="{type:'validatebox',options:{required:true}}">编码</th>
                        <th data-options="field:'enabled',formatter:enabledimgbox" width="80">状态</th>
                    </tr>
                </thead>
            </table>
        </div>
        <div id="dictionary_center" data-options="region:'center',title:'明细'" style="width: 420px;">
            <table id="dictionary_detail_dg">
                <thead>
                    <tr>
                    	<th data-options="field:'ck', checkbox:true"></th>
                    	<th data-options="field:'dictionaryId'" hidden="true" width="80" editor="text"></th>
                        <th data-options="field:'name',sorter:sorter" width="80" sortable="true" required = "true" editor="{type:'validatebox',options:{required:true}}">名称</th>
                        <th data-options="field:'code',sorter:sorter" width="100" sortable="true" required = "true" editor="{type:'validatebox',options:{required:true}}">编码</th>
                        <th data-options="field:'enabled',formatter:enabledimgbox" width="80">状态</th>
                    </tr>
                </thead>
            </table>
        </div>
    </div>
    <!--字典目录工具栏-->
    <div id="dic_search">
	    <form id="dic_search_form"> 
	         <table>
	             <tr>
	                  <a class="easyui-linkbutton" iconCls="icon-add" plain="true"  onclick="dic_add();">添加</a>
	                  <a class="easyui-linkbutton" iconCls="icon-save" plain="true"  onclick="dic_save();">保存</a>
	                  <a class="easyui-linkbutton" iconCls="icon-redo" plain="true"  onclick="dic_redo();">撤销</a>
	                  <a class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="dic_remove();">删除</a>
	                  <a class="easyui-linkbutton" iconCls="icon-ok" plain="true"  onclick="dic_enabled();">启用</a>
	                  <a class="easyui-linkbutton" iconCls="icon-no" plain="true"  onclick="dic_disabled();">停用</a>
	                  <a class="easyui-linkbutton" iconCls="icon-look" plain="true"  onclick="detailHandler();">明细</a>
	             </tr>
	             <tr>
	                 <td>名称</td> 
	                 <td><input name="name" class="easyui-textbox" data-options="prompt:'名称'" editor="text"> 
	                 </td> 
	                 <td>编码</td> 
	                 <td><input name="code" class="easyui-textbox" data-options="prompt:'编码'"> 
	                 </td> 
	             </tr> 
	             <tr> 
	                 <td>状态</td> 
	                 <td><input name="enabled" value="1" type="radio">启用<input value="0" name="enabled" type="radio">停用</td> 
	             </tr> 
	         </table> 
	     </form>
     </div>
     <!--字典明细工具栏 -->
     <div id="dic_detail_search">
	     <form id="dic_detail_search_form"> 
	         <table>
	             <tr>
	                  <a class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="dic_detail_add();">添加</a>
	                  <a class="easyui-linkbutton" iconCls="icon-save" plain="true"  onclick="dic_detail_save();">保存</a>
	                  <a class="easyui-linkbutton" iconCls="icon-redo" plain="true"  onclick="dic_detail_redo();">撤销</a>
	                  <a class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="dic_detail_remove();">删除</a>
	                  <a class="easyui-linkbutton" iconCls="icon-ok" plain="true"  onclick="dic_detail_enabled();">启用</a>
	                  <a class="easyui-linkbutton" iconCls="icon-no" plain="true"  onclick="dic_detail_disabled();">停用</a>
	             </tr>
	             <tr>
	                 <td>名称</td> 
	                 <td><input name="name" class="easyui-textbox" data-options="prompt:'名称'"> 
	                 </td> 
	                 <td>编码</td> 
	                 <td><input name="code" class="easyui-textbox" data-options="prompt:'编码'"> 
	                 </td> 
	             </tr> 
	             <tr> 
	                 <td>状态</td> 
	                 <td><input name="enabled" value="1" type="radio">启用<input value="0" name="enabled" type="radio">停用</td> 
	             </tr> 
	         </table> 
	     </form>
     </div>
     <!-- 数据字典右键 --> 
     <div id="dic_dg_rcmenu" class="easyui-menu" style=""> 
         <div id="dic_search_btn">查询</div> 
         <div id="dic_reset_btn">重置</div> 
     </div>
     
     <!-- 数据字典明细右键 --> 
     <div id="dic_detail_dg_rcmenu" class="easyui-menu" style="">
         <div id="dic_detail_search_btn">查询</div>
         <div id="dic_detail_reset_btn">重置</div> 
     </div> 
   
    
    <script type="text/javascript">
        $(function(){
            $("#dictionary_dg").datagrid({
            	url:'sysDictionary/search.html',
                toolbar : "#dic_search",
                method:'get',
                border:false,
                idField:'id',
                singleSelect:false,
                fit:true,
                remoteSort:false,
                fitColumns:true,
                pagination:true,
                rownumbers:true,
                queryParams : serializeObject($("#dic_search_form")),
                onDblClickRow :onDblClickRow
            });
            
            $("#dictionary_detail_dg").datagrid({
                toolbar: "#dic_detail_search",
                //url:'sysDictionaryDetail/search.html',
                border:false,
                singleSelect:false,
                fit:true,
                remoteSort:false,
                fitColumns:true,
                pagination:true,
                idField:'id',
                rownumbers:true,
                onDblClickRow :onDblClickRow_detail,
                queryParams : serializeObject($("#dic_detail_search_form"))
            });
            
            $("#dictionary_west").bind('contextmenu', function(e) { 
                e.preventDefault(); 
                $('#dic_dg_rcmenu').menu('show', { 
                    left : e.pageX, 
                    top : e.pageY 
                }); 
                  
                 return false; 
             });
            
            $("#dictionary_center").bind('contextmenu', function(e) { 
                e.preventDefault(); 
                $('#dic_detail_dg_rcmenu').menu('show', { 
                    left : e.pageX, 
                    top : e.pageY 
                }); 
                  
                 return false; 
             });
            
            $('#dic_search_btn').click(function(){
                $('#dictionary_dg').datagrid('load',serializeObject($("#dic_search_form")));
            });
            
            $('#dic_reset_btn').click(function(){
                 $("#dic_search_form")[0].reset();
            });
                        
            $('#dic_detail_search_btn').click(function(){
            	var params = serializeObject($("#dic_detail_search_form"));
                $('#dictionary_detail_dg').datagrid('load',params);
            });
            
            $('#dic_detail_reset_btn').click(function(){
                $("#dic_detail_search_form")[0].reset();
            });

        });
        
        function enabledimgbox(cellvalue, options, rowObject){
            return cellvalue == 0 ? '<img src="js/easyui1.4.1/themes/icons/no.png" alt="无效" title="无效" />' : '<img src="js/easyui1.4.1/themes/icons/ok.png" alt="有效" title="有效" />';
        }

        var editRow = undefined;

        //新增字典目录
        function dic_add(){

			$('#dictionary_dg').datagrid('insertRow',{
	    		index : 0,
	    		row : {}
			});

        	$('#dictionary_dg').datagrid('beginEdit',0);
        }

        //保存字典目录
        function dic_save(){
        	endEdit();
        	
        	var $dg = $('#dictionary_dg');
        	var rows = $dg.datagrid('getChanges');
        	if(rows.length <= 0){
        		$.messager.alert('提示','当前未修改任何记录!');
        		return;
        	}
        	
            var inserted = $dg.datagrid('getChanges', "inserted");
            var deleted = $dg.datagrid('getChanges', "deleted");
            var updated = $dg.datagrid('getChanges', "updated");
            var effectRow = new Object();
            if (inserted.length) {
                effectRow["inserted"] = JSON.stringify(inserted);
            }
            /*if (deleted.length) {
                effectRow["deleted"] = JSON.stringify(deleted);
            }*/
            if (updated.length) {
                effectRow["updated"] = JSON.stringify(updated);
            }

            $.post("sysDictionary/save.html",effectRow,function(data, textStatus, jqXHR){
	        		if(data.success == false){
	        			$.messager.alert('提示',data.message);
						return;
	        		}
	        		//保存成功后, 刷新当前页
        			$('#dictionary_dg').datagrid('load');
        			$.messager.alert('提示','保存成功!');
	        	},"json");

        	
        }

        //撤销字典目录操作
        function dic_redo(){
        	$.messager.confirm('提示','确定撤销?',function(r){
        		if (r){
        			$('#dictionary_dg').datagrid('rejectChanges');
        			editRow = undefined;
        		};
        	});
        }

        //删除字典目录
        function dic_remove(){
        	var rows = $('#dictionary_dg').datagrid('getChecked');
        	if(rows == undefined || rows.length <= 0){
        		$.messager.alert('提示','未选择任何记录!');
        		return;
        	}
        	$.messager.confirm('提示','确定删除?',function(r){
        		if (r){
        			var ids = new Array();
		        	for (var i = rows.length - 1; i >= 0; i--) {
		        		ids.push(rows[i].id);
		        	}

		        	$.post("sysDictionary/delete.html",{
		        		ids : ids.join(',')
		        	},function(data, textStatus, jqXHR){
		        		if(data.success == false){
		        			$.messager.alert('提示','删除失败!');
							return;
		        		}
		        		//删除成功后, 刷新当前页
	        			$('#dictionary_dg').datagrid('reload');
	        			$.messager.alert('提示','删除成功!');
		        	},"json");
        		};
        	});
        }

        //双击行触发事件
        function onDblClickRow(index,row){
        	if(editRow != undefined){
        		//与后台交互,执行保存操作
        		$('#dictionary_dg').datagrid('endEdit',editRow);
        	}
        	editRow = index;
        	$('#dictionary_dg').datagrid('beginEdit',editRow);
        }

		//结束编辑
        function endEdit(){
            var rows = $('#dictionary_dg').datagrid('getRows');
            for ( var i = 0; i < rows.length; i++) {
                $('#dictionary_dg').datagrid('endEdit', i);
            }
        }

        //启用
        function dic_enabled(){
        	var rows = $('#dictionary_dg').datagrid('getChecked');
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

		        	$.post("sysDictionary/enabled.html",{
		        		ids : ids.join(',')
		        	},function(data, textStatus, jqXHR){
		        		if(data.success == false){
		        			$.messager.alert('提示','启用失败!');
							return;
		        		}
		        		//删除成功后, 刷新当前页
	        			$('#dictionary_dg').datagrid('reload');
	        			$.messager.alert('提示','启用成功!');
		        	},"json");
        		};
        	});
        }

        //停用
        function dic_disabled(){
        	var rows = $('#dictionary_dg').datagrid('getChecked');
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

		        	$.post("sysDictionary/disabled.html",{
		        		ids : ids.join(',')
		        	},function(data, textStatus, jqXHR){
		        		if(data.success == false){
		        			$.messager.alert('提示','停用失败!');
							return;
		        		}
		        		//删除成功后, 刷新当前页
	        			$('#dictionary_dg').datagrid('reload');
	        			$.messager.alert('提示','停用成功!');
		        	},"json");
        		};
        	});
        }



        var editRow_detail = undefined;
        var dictionaryId = undefined;

        //查看字典明细
        function detailHandler(){

        	var rows = $('#dictionary_dg').datagrid('getChecked');
        	if (rows.length != 1) {
        		$.messager.alert('提示','前选择一条记录查看明细!');
        		return;
        	};

        	var row = rows[0];

        	var params = serializeObject($("#dic_detail_search_form"));
        	params.dictionaryId = row.id;
        	//更新当前数据字典明细的目录主键
        	dictionaryId = row.id;

        	if(dictionaryId == undefined){
        		$.messager.alert('提示','当前记录为空或未保存!');
        		return;
        	}
        	
        	$('#dictionary_detail_dg').datagrid({
        	    url:'sysDictionaryDetail/search.html'
        	});
            $('#dictionary_detail_dg').datagrid('load',params);

        	 $("#dictionary_detail_dg").datagrid({
        	 	title : row.name
        	 });
        }

        //新增字典明细
        function dic_detail_add(){
        	if(dictionaryId == undefined){
        		$.messager.alert('提示','请先选择一条数据字典目录记录!');
        		return;
        	}
        	$('#dictionary_detail_dg').datagrid('insertRow',{
	    		index : 0,
	    		row : {
	    			dictionaryId:dictionaryId
	    		}
			});

        	$('#dictionary_detail_dg').datagrid('beginEdit',0);
        }

        //保存字典明细
        function dic_detail_save(){
        	if(dictionaryId == undefined){
        		$.messager.alert('提示','请先选择一条数据字典目录记录!');
        		return;
        	}

        	endEdit_detail();
        	
        	var $dg = $('#dictionary_detail_dg');
        	var rows = $dg.datagrid('getChanges');
        	if(rows.length <= 0){
        		$.messager.alert('提示','当前未修改任何记录!');
        		return;
        	}

        	//校验行
        	for (var i = rows.length - 1; i >= 0; i--) {
        		var row = rows[i];
        		var result = $dg.datagrid('validateRow', row.index);
        		if(!result){
        			$.messager.alert('提示','部分记录校验未通过!');
        			return;
        		}
        	};

            var inserted = $dg.datagrid('getChanges', "inserted");
            var deleted = $dg.datagrid('getChanges', "deleted");
            var updated = $dg.datagrid('getChanges', "updated");
            var effect = new Object();
            if (inserted.length) {
                effect["inserted"] = JSON.stringify(inserted);
            }
            /*if (deleted.length) {
                effectRow["deleted"] = JSON.stringify(deleted);
            }*/
            if (updated.length) {
                effect["updated"] = JSON.stringify(updated);
            }

            $.post("sysDictionaryDetail/save.html",effect,function(data, textStatus, jqXHR){
	        		if(data.success == false){
	        			$.messager.alert('提示',data.message);
						return;
	        		}
	        		//保存成功后, 刷新当前页
        			$('#dictionary_detail_dg').datagrid('load');
        			$.messager.alert('提示','保存成功!');
	        	},"json");

        }

        //撤销字典明细
        function dic_detail_redo(){
        	if(dictionaryId == undefined){
        		$.messager.alert('提示','请先选择一条数据字典目录记录!');
        		return;
        	}

        	$.messager.confirm('提示','确定撤销?',function(r){
        		if (r){
        			$('#dictionary_detail_dg').datagrid('rejectChanges');
        			editRow_detail = undefined;
        		};
        	});
        }

        //删除字典明细
        function dic_detail_remove(){
        	if(dictionaryId == undefined){
        		$.messager.alert('提示','请先选择一条数据字典目录记录!');
        		return;
        	}

        	var rows = $('#dictionary_detail_dg').datagrid('getChecked');
        	if(rows == undefined || rows.length <= 0){
        		$.messager.alert('提示','未选择任何记录!');
        		return;
        	}
        	$.messager.confirm('提示','确定删除?',function(r){
        		if (r){
        			var ids = new Array();
		        	for (var i = rows.length - 1; i >= 0; i--) {
		        		ids.push(rows[i].id);
		        	}

		        	$.post("sysDictionaryDetail/delete.html",{
		        		ids : ids.join(',')
		        	},function(data, textStatus, jqXHR){
		        		if(data.success == false){
		        			$.messager.alert('提示','删除失败!');
							return;
		        		}
		        		//删除成功后, 刷新当前页
	        			$('#dictionary_detail_dg').datagrid('reload');
	        			$.messager.alert('提示','删除成功!');
		        	},"json");
        		};
        	});
        }

        //双击行触发事件
        function onDblClickRow_detail(index,row){
        	if(editRow_detail != undefined){
        		//与后台交互,执行保存操作
        		$('#dictionary_detail_dg').datagrid('endEdit',editRow_detail);
        	}
        	editRow_detail = index;
        	$('#dictionary_detail_dg').datagrid('beginEdit',editRow_detail);
        }

        //启用
        function dic_detail_enabled(){
        	if(dictionaryId == undefined){
        		$.messager.alert('提示','请先选择一条数据字典目录记录!');
        		return;
        	}

        	var rows = $('#dictionary_detail_dg').datagrid('getChecked');
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

		        	$.post("sysDictionaryDetail/enabled.html",{
		        		ids : ids.join(',')
		        	},function(data, textStatus, jqXHR){
		        		if(data.success == false){
		        			$.messager.alert('提示','启用失败!');
							return;
		        		}
		        		//删除成功后, 刷新当前页
	        			$('#dictionary_detail_dg').datagrid('reload');
	        			$.messager.alert('提示','启用成功!');
		        	},"json");
        		};
        	});
        }

        //停用
        function dic_detail_disabled(){
        	if(dictionaryId == undefined){
        		$.messager.alert('提示','请先选择一条数据字典目录记录!');
        		return;
        	}

        	var rows = $('#dictionary_detail_dg').datagrid('getChecked');
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

		        	$.post("sysDictionaryDetail/disabled.html",{
		        		ids : ids.join(',')
		        	},function(data, textStatus, jqXHR){
		        		if(data.success == false){
		        			$.messager.alert('提示','停用失败!');
							return;
		        		}
		        		//删除成功后, 刷新当前页
	        			$('#dictionary_detail_dg').datagrid('reload');
	        			$.messager.alert('提示','停用成功!');
		        	},"json");
        		};
        	});
        }

        //结束编辑
        function endEdit_detail(){
            var rows = $('#dictionary_detail_dg').datagrid('getRows');
            for ( var i = 0; i < rows.length; i++) {
                $('#dictionary_detail_dg').datagrid('endEdit', i);
            }
        }
    </script>
</body>
</html>
