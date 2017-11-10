layui.config({
    base: "js/"
}).use(['element','table','jquery'],function() {
    var element = layui.element,
        table = layui.table,
        $ = layui.jquery;
       $("#left-menu").on("click","a",function () {
          var data = $(this).attr("data-url");
          if (data) {
              var jsonData = JSON.parse(data);
              // alert(jsonData.url);
              var iframe = $("#main-content").children('iframe');
              iframe.attr("src",jsonData.url);
          }
       });
});
