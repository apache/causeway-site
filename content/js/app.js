$('#hello-world').submit(function(ev) {
    ev.preventDefault(); // to stop the form from submitting
    /* Validations go here */

    var searchField = $('#searchfield');
    var searchText = searchField.val()


    $.getJSON('/elasticlunr/index.json', function (data) {

        var index = elasticlunr.Index.load(data);
        var searchResults = index.search(searchText);

        $('#search-results').empty();
        if(searchResults.length === 0) {

            $('#search-results').append("<br/>No matches found for '" + searchText + "'<br/><br/>");

        } else {
            for (var i = 0; i < searchResults.length; i++) {

                var searchResult = searchResults[i];
                var ref = searchResult['ref'];

                var doc = index.documentStore.docs[ref];

                var title = doc.title;
                var description = doc.description;
                var url = doc.url;

                if(description) {
                    $('#search-results').append("<br/><a href='" + url + "'>" + title + "</a><br/><p>" + description + "</p>");
                }
            };
        }
        $('#search-results').focus();
        $('html,body').animate({
            scrollTop: $("#search-results").offset().top - 80
        });

    });

    $(searchField).val('');
});

