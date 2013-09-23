// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require jquery-ui
//= require jquery-tablesorter
//= require autocomplete-rails
//= require highcharts
//= require highcharts/highcharts-more 
//= require bootstrap
//= require bootstrap-tooltip
//= require bootstrap-popover
//= require turbolinks
//= require_tree .

var ready = function () {
  $('[rel=tooltip]').tooltip({ container: 'body' });
  $('[rel=tooltip]').on('click', function(e) {e.preventDefault(); return true;});
  
  $('[rel=popover]').popover({ placement : 'right',
  							   container: 'body'
  							  });
  $('[rel=popover]').on('click', function(e) {e.preventDefault(); return true;}); 
};

$(document).ready(ready);
$(document).on('page:load', ready);