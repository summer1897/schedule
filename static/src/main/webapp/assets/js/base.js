layui.config({
    base: "js/"
}).use(['element','table','jquery'],function() {
    var element = layui.element,
        table = layui.table,
        $ = layui.jquery;

    $(function () {
       $("#left-menu").on("click","a",function () {
          var data = $(this).attr("data-url");
          alert(data);
          if (data) {
              alert("url: " + data.url + ",title: " + data.title);
          }
       });
    });
});
