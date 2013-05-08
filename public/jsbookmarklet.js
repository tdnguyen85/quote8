//bookmarklet code

// javascript:(function(){document.body.appendChild(document.createElement('script')).src='http://localhost:3000/jsbookmarklet.js?q=Math.random()';})();

//vital parts of the code:

//1) this public facing js file
//2) the rails routes in app/bookmarks_controller.rb and the "new" action

(function(){

  var v = "1.9.1";

  if (window.jQuery === undefined || window.jQuery.fn.jquery < v) {
    var done = false;
    var script = document.createElement("script");
    script.src = "http://ajax.googleapis.com/ajax/libs/jquery/" + v + "/jquery.min.js";
    script.onload = script.onreadystatechange = function(){
      if (!done && (!this.readyState || this.readyState == "loaded" || this.readyState == "complete")) {
        done = true;
        initMyBookmarklet();
      }
    };
    document.getElementsByTagName("head")[0].appendChild(script);
  } else {
    initMyBookmarklet();
  }

  function initMyBookmarklet() {
    (window.myBookmarklet = function() {

      var doctitle = document.title;
      var doclocation = document.location;
      var selectedText = '';

      function getSelText() {
        var SelText = '';
        if (window.getSelection) {
          SelText = window.getSelection();
        } else if (document.getSelection) {
          SelText = document.getSelection();
        } else if (document.selection) {
          SelText = document.selection.createRange().text;
        }
        return SelText;
      }

       selectedText = getSelText();

     var NWin = window.open('http://localhost:3000/bookmarks/new?text= ' + encodeURIComponent(selectedText) + '&title=' + encodeURIComponent(doctitle) + '&url=' + encodeURIComponent(doclocation) + '&bookmarklet=1' , '', 'height=400,width=400');

     if (window.focus)
     {
       NWin.focus();

     }
     return false;

    })();
  }


})();
