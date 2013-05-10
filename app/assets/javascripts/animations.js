$(document).ready(function() {

  $("#shake").mouseenter(function () {
    $(this).effect("shake", { times:2 }, 500);
  });

  $('#button').hover(function(){
    $('#arrow').animate({
      opacity: 1,
      width: '100px',
      height: '200px',
      top: '-100px'
    }, 500);
  }, function() {
    $('#arrow').animate({
      opacity: 0,
      width: '1px',
      height: '1px',
      top: '120px'
      }  , 500);
  }); 

});
