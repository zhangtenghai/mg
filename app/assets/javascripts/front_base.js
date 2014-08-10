jQuery(document).ready(function() {
  $(".like").click(function(e){
    if (!$(this).hasClass("fancybox")){
      $.ajax({
        url: $(this).data("remote-url")
      }).done(function(data){
        
      });
    }
  });
});