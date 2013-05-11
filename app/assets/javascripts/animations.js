$(document).ready(function() {

  $("#shake").mouseenter(function () {
    $(this).effect("shake", { times:2, distance: 3}, 500);
  });

  $('#bookmarklet-container').hover(function(){
    if (!$('#bookmarklet-arrow').is(':visible')){
     $('#bookmarklet-arrow').fadeIn('slow');
    }
   }, function() {
    $('#bookmarklet-arrow').fadeOut('slow');

   });


  $('#show_more').on('click', function(event){
    event.preventDefault();
  $('#hidden').toggle('slow');
  });

  //   $('#bookmarklet-arrow').animate({
  //     opacity: 1,    
  //   }, 500);
  // }, function() {
  //   $('#bookmarklet-arrow').animate({
  //     opacity: 0,
  //     }  , 500);
  // }); 

});
