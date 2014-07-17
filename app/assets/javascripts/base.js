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

function fillProvinces(province_control){
  $.ajax({
    url: "/ajax/districts/provinces"
  }).done(function(data){
    $(province_control).empty();
    $(province_control).select2("data", null);
    $(data).each(function(index, item){
      $(province_control).append(new Option(item));
    });
    $(province_control).change();
  });
}

function fillCities(province_control, city_control){
  $.ajax({
    url: "/ajax/districts/cities?province=" + $(province_control).val()
  }).done(function(data){
    $(city_control).empty();
    $(city_control).select2("data", null);
    $(data).each(function(index, item){
      $(city_control).append(new Option(item));
    });
    $(city_control).change();
  });
}

function fillRegions(province_control, city_control, region_control){
  $.ajax({
    url: "/ajax/districts/regions?province=" + $(province_control).val() + "&city=" + $(city_control).val()
  }).done(function(data){
    $(region_control).empty();
    $(region_control).select2("data", null);
    $(data).each(function(index, item){
      $(region_control).append(new Option(item));
    });
    $(region_control).change();
  });
}