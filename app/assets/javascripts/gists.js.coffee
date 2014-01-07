#TODO- refactor for specific routes
$ ->
  $('.gist').each( (i, obj) ->
    gist_id = $(obj).data('gist_id')
    
    $.when($.get("https://api.github.com/gists/#{gist_id}"))
    .done((gist) -> 
      console.log gist
      #description
      $(obj).find('.js-gist-description').html(gist.description)
      
      #handle thumbnails
      if gist.files['thumbnail.png'] && $(obj).find('.js-gist-thumbnail').length > 0
        thumb = gist.files['thumbnail.png']
        $(obj).find('.js-gist-thumbnail').attr('src',thumb.raw_url)
      
      #handle gist display
      if gist.files['index.html'] && $(obj).find('.js-gist-display').length > 0
        console.log 'dis'
        $(obj).find('.js-gist-display').html("<iframe scrolling='no' src='http://bl.ocks.org/grahamjenson/raw/#{gist_id}/' style='width: 100%; height: 350px'></iframe>")
        

      #handle gist markdown
      if gist.files['README.md'] && $(obj).find('.js-gist-markdown').length > 0
        readme = gist.files['README.md'].content
        $(obj).find('.js-gist-markdown').html(GhostTrain.front_markdown.makeHtml(readme))
    )
  )