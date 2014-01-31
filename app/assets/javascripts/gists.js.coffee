#TODO- refactor for specific routes
$ ->
  $('.gist').each( (i, obj) ->
    gist_id = $(obj).data('gist_id')
    
    $.when($.get("https://api.github.com/gists/#{gist_id}"))
    .done((gist) -> 
      #description
      $(obj).find('.js-gist-description').html(gist.description)
      
      #handle thumbnails
      if gist.files['thumbnail.png'] && $(obj).find('.js-gist-thumbnail').length > 0
        thumb = gist.files['thumbnail.png']
        $(obj).find('.js-gist-thumbnail').attr('src',thumb.raw_url)
      
      #handle gist display
      if gist.files['index.html'] 
        if $(obj).find('.js-gist-display').length > 0
          $(obj).find('.js-gist-display').html("<iframe scrolling='no' src='http://bl.ocks.org/grahamjenson/raw/#{gist_id}/' style='width: 100%; height: 502px'></iframe>")
        if $(obj).find('.js-gist-index').length > 0
          code =  gist.files['index.html'].content
          code = hljs.highlight('html', code).value
          code = "<pre><code class='html hljs'>#{code}</code></pre>"
          $(obj).find('.js-gist-index').html(code)

      #handle gist markdown
      if gist.files['README.md'] && $(obj).find('.js-gist-markdown').length > 0
        readme = gist.files['README.md'].content
        $(obj).find('.js-gist-markdown').html(GhostTrain.front_markdown.makeHtml(readme))
    )
  )