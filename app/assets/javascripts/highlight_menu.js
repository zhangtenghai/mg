var HighlightMenu = function () {
  var handleSelectMenu = function(){
    current_menu = $.cookie('_highlight_menu');
    if(current_menu != null && current_menu != "menu_dashboard"){
      $("#" + current_menu).closest("ul").closest("li").addClass("active");
      $("#" + current_menu).closest("ul").closest("li").find("a:first").append("<span class=\"selected\"></span>");
    }else{
      $("#menu_dashboard").closest("li").addClass("active");
      $("#menu_dashboard").closest("li").find("a:first").append("<span class=\"selected\"></span>");
    }

    $('body').on('click', 'ul.nav a', function(e){
      $.removeCookie('_highlight_menu', { path: '/' });
      $.cookie('_highlight_menu', $(this).attr("id"), { path: '/' });
    });
  }

  return {
    init: function () {
      handleSelectMenu();
    }
  };
}();