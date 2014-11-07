<div class="easyui-panel" data-options="" style="padding:5px ; height: 100%;">
    <ul id="_west_content_tree" class="easyui-tree" data-options="
                url:'view/tree_data1.json',
                method:'get',
                animate:true,
                formatter:function(node){
                    var s = node.text;
                    if (node.children){
                        s += '&nbsp;<span style=\'color:blue\'>(' + node.children.length + ')</span>';
                    }
                    return s;
                }
            ">
    </ul>
</div>

<script type="text/javascript">
    $(document).ready(function(){
    	$('#_west_content_tree').tree({
    	    onClick: function(node){
    	        if(! node.children){
    	        	//判断当前tab页是否已打开
    	        	var isExist = $('#main_content').tabs('exists',node.text);
    	        	if(isExist){
    	        		$('#main_content').tabs('select',node.text);
    	        	}else {
    	        		$('#main_content').tabs('add',{
                            title: node.text,
                            content: '<div style="background-color: grey;width: 100%; height:100%;">Content'+node.text+'</div>',
                            closable: true
                        });
    	        	}
    	        }
    	    }
    	});
    });
</script>