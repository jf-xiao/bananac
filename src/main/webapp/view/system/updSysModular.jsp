<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>新增系统模块</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

  </head>
  
  <body>
      <form id="addSysModularForm" method="post" style="padding:10px;">
          <input id="parentId" name="parentId" type="hidden">
          <div style="margin-bottom:20px">
              <div>名称:</div>
              <input class="easyui-textbox" id="name" name="name" style="width:70%;height:32px" data-options="prompt:'名称',required:true">
          </div>
          <div style="margin-bottom:20px">
              <div>编码:</div>
              <input class="easyui-textbox" id="code" name="code" style="width:70%;height:32px" data-options="prompt:'编码',required:true">
          </div>
          <div style="margin-bottom:20px">
              <div>URL:</div>
              <input class="easyui-textbox" id="url" name="url" style="width:70%;height:32px" data-options="prompt:'URL',required:true">
          </div>
          <div style="margin-bottom:20px">
              <div>可用:<input type="checkbox" id="enabled" name="enabled" value="1"/></div>
          </div>
          <div data-options="border:false" style="text-align:left;padding:5px 0 0;">
              <a class="easyui-linkbutton" data-options="iconCls:'icon-save'" onclick="javascript:save();" style="width:80px">保存</a>
              <a class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" onclick="javascript:cancle();" style="width:80px">取消</a>
          </div>
      </form>
        <script type="text/javascript">
        $(function(){
              var row = $('#tg').treegrid('getSelected');
              if(row){
                $('#parentId').val(row.id);
                $('#name').val(row.name);
                $('#code').val(row.code);
                $('#url').val(row.url);
                if(row.enabled == 1){
                    $('#enabled').attr('checked','checked');
                }
              }
          });
        
          //保存
          function save(){
              var params = serializeObject($("#addSysModularForm"));
              console.info(params);
              $.post("sysModular/add.html",params,function(data, textStatus, jqXHR){
                if(data.success == false){
                  $.messager.alert('提示',data.message);
                    return;
                  }
                  //保存成功后
                  $.messager.alert('提示','保存成功!');
                  $('#tg').treegrid('reload');
                  $('#w').window('close');
              },"json");
            }

          //取消
          function cancle(){
            $('#w').window('close');
          }
      </script>
  </body>
</html>
