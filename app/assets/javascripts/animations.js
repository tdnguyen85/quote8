// logo animation

$(document).ready(function() {
  $("#shake").mouseenter(function () {
    $(this).effect("shake", { times:2, distance: 3}, 500);
  });

//arrow appearance over bookmarklet

  $('#bookmarklet-container').hover(function(){
    if (!$('#bookmarklet-arrow').is(':visible')){
      $('#bookmarklet-arrow').fadeIn('slow');
    }
  }, function() {
    $('#bookmarklet-arrow').fadeOut('slow');
  });

//extend new quote fields

  $('#show_more').on('click', function(event){
    event.preventDefault();
    $('#hidden').toggle('slow');
  });
});
