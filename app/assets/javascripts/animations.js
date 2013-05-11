$(document).ready(function() {

  $("#shake").mouseenter(function () {
    $(this).effect("shake", { times:2 }, 500);
  });

  $('#bookmarklet-button').hover(function(){
    $('#bookmarklet-arrow').animate({
      opacity: 1,
      
      top: '-62px'
    }, 500);
  }, function() {
    $('#bookmarklet-arrow').animate({
      opacity: 0,

      top: '-62px'
      }  , 300);
  }); 

});
