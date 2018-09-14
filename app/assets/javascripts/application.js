//= require jquery
//= require jquery_ujs
//= require materialize-sprockets

$( document ).ready(function() {
  $('.datepicker').pickadate({
    format: 'yyyy/mm/dd',
    today: false,
    selectMonths: true,
    selectYears: +100,
    min: new Date()
  });
});