//# Place all the behaviors and hooks related to the matching controller here.
//# All this logic will automatically be available in application.js.
//# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

// Return a helper with preserved width of cells
$(document).ready(function() {
  var fixHelper = function(e, ui) {
    ui.children().each(function() {
      $(this).width($(this).width());
    });
    return ui;
  };

  $("#sort tbody").sortable({
    helper: fixHelper
  }).disableSelection();
});

jQuery ->
  $('#bookmarks').sortable
    axis: 'y'
    handle: '.handle'
    update: ->
      $.post($(this).data('update-url'), $(this).sortable('serialize'))