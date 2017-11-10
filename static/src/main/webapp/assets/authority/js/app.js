layui.config({
    base: "js/"
}).use(['element','table','jquery'],function() {
    var element = layui.element,
        table = layui.table,
        $ = layui.jquery,
        layer = layui.layer;
    table.on('edit(resource-list)',function(obj) {
        var field = obj.field;
        var value = obj.value;
        var id = obj.data.id;
       /* console.log("value: ",obj.value); //得到修改后的值
        console.log("field: ",obj.field); //当前编辑的字段名
        console.log(obj.data.id); //所在行的所有相关数据*/
       $.post({
           url: "/schedule/resource/json/update",
           data: {id:id,field:field,value:value},
           dataType: "json",
           success: function(data) {
               console.log("data: ",data);
               var code = data.code;
               if (code > 0) {
                   layer.msg("数据修改成功!");
               } else {
                   layer.msg(data.msg, function(){
                   });
               }
           }
       });
    });
});