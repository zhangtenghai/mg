jQuery(document).ready(function() {
  $(".like").click(function(e){
    if (!$(this).hasClass("fancybox")){
      $.ajax({
        url: $(this).data("remote-url")
      }).done(function(data){
        
      });
    }
  });

  $( "#global_search" ).keypress(function( event ) {
    if ( event.which == 13 ) {
       $("#global_search_form").submit();
       event.preventDefault();
    }
  
  });

  $( "#game_search" ).keypress(function( event ) {
    if ( event.which == 13 ) {
       $("#game_search_form").submit();
       event.preventDefault();
    }
  
  });
});