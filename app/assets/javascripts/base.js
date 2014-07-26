jQuery(document).ready(function() {

  $('form').on('click', '.remove_fields', function(e){
    $(this).prev('input[type=hidden]').val('1');
    $(this).closest('tr').hide();

    Metronic.runResizeHandlers();
    return e.preventDefault();
  });

  $('form').on('click', '.add_fields', function(e){
    var regexp, time;
    time = new Date().getTime();
    regexp = new RegExp($(this).data('id'), 'g');
    
    $(this).closest('tr').before($(this).data('fields').replace(regexp, time));

    Metronic.runResizeHandlers();
    
    $(this).closest('tr').prev('tr').find('.select2me').select2({
      placeholder: "请选择",
      allowClear: true
    });

    $(this).closest('tr').prev('tr').find('.date-picker').datepicker({
      format: "yyyy-mm-dd",
      autoclose: true
    });

    return e.preventDefault();
  });

  $('form').on('click', '.add_row', function(e){
    $(this).closest('tr').before($(this).data('fields'));
    Metronic.runResizeHandlers();
    return e.preventDefault();
  });

  $('form').on('click', '.remove_row', function(e){
    $(this).closest('tr').remove();
    Metronic.runResizeHandlers();
    return e.preventDefault();
  });
});

