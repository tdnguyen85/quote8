function showQuote() {
	var randNum = Math.floor(Math.random()*quotes.length)
	$'#web_wait_quote').html('<div class="quote_text">"' + quotes[randNum].text + '"</div><div class="quote_author">Bill Watterson</div>');
}