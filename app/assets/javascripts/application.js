// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require bootstrap-sprockets
//= require jquery.turbolinks
//= require jquery_ujs
//= require dataTables/jquery.dataTables
//= require dataTables/bootstrap/3/jquery.dataTables.bootstrap
//= require turbolinks
//= require cocoon
//= require_tree .

$(function() {

  $('#before_order_login_form').on('ajax:success', function() {
    $(this).addClass('hide');
    $('#you_can_order_now').removeClass('hide');
  });

  $('.fooditem_quantity').on('change', function() {
    console.log('aaa');

  });

  $('#add_fooditem_btn').click(function(){
    console.log('aaa');
    $(this).text("繼續加入");
  });

  $('#food_table').DataTable({
    ordering: false,
    paging: false,
    info: false,
  });


  $(".links a.add_fields").
    data("association-insertion-method", 'append').
    data("association-insertion-node", '#your_foods');
  
});