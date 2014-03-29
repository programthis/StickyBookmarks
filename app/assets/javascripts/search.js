$(document).ready(function(){

	var books;
	var book_names = [];
	var book_authors = [];

	$.ajax({
	  type: "GET",
	  url: "/books",
	  dataType: "json"
	}).done(function(response){
	  books = response;
	  setBookarray(books);
	});

	function setBookarray(books){
		var numBooks = books.length;
		for (var i = 0; i < books.length ; i++){
			book_names[i] = books[i].name;
			book_authors[i] = books[i].authors;
		}
	}

	var substringMatcher = function(strs) {
	  return function findMatches(q, cb) {
	    var matches, substringRegex;
	 
	    // an array that will be populated with substring matches
	    matches = [];
	 
	    // regex used to determine if a string contains the substring `q`
	    substrRegex = new RegExp(q, 'i');
	 
	    // iterate through the pool of strings and for any string that
	    // contains the substring `q`, add it to the `matches` array
	    $.each(strs, function(i, str) {
	      if (substrRegex.test(str)) {
	        // the typeahead jQuery plugin expects suggestions to a
	        // JavaScript object, refer to typeahead docs for more info
	        matches.push({ value: str });
	      }
	    });
	 
	    cb(matches);
	  };
	};
	 
	$('#the-basics .typeahead').typeahead({
	  hint: true,
	  highlight: true,
	  minLength: 1
	},
	{
	  name: 'books',
	  displayKey: 'value',
	  source: substringMatcher(book_names)
	});
});