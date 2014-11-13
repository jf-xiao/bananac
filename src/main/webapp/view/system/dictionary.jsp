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

<title></title>

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
                        <th data-options="field:'name'" width="80" editor="text">名称</th>
                        <th data-options="field:'code'" width="100" editor="text">编码</th>
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
                        <th data-options="field:'name'" width="80">名称</th>
                        <th data-options="field:'code'" width="100">编码</th>
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
                fitColumns:true,
                pagination:true,
                rownumbers:true,
                queryParams : serializeObject($("#dic_search_form")),
                onDblClickRow :onDblClickRow
            });
            
            $("#dictionary_detail_dg").datagrid({
                toolbar: "#dic_detail_search",
                border:false,
                singleSelect:false,
                fit:true,
                fitColumns:true,
                pagination:true,
                idField:'id',
                rownumbers:true,
                rownumbers:true,
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
                $('#dictionary_detail_dg').datagrid('load',serializeObject($("#dic_detail_search_form")));
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
	        			$.messager.alert('提示','保存失败!');
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

        //新增字典明细
        function dic_detail_add(){
        	window.alert("");
        }

        //保存字典明细
        function dic_detail_save(){
        	window.alert("");
        }

        //撤销字典明细
        function dic_detail_redo(){
        	window.alert('');
        }

        //删除字典明细
        function dic_detail_remove(){
        	window.alert("");
        }
    </script>
</body>
</html>
