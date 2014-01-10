$ ->
  $('.blog-post').each( (i, obj) ->
    #handle  markdown
    if $(obj).find('.js-post-markdown').length > 0
      md = $(obj).data('markdown')
      $(obj).find('.js-post-markdown').html(GhostTrain.front_markdown.makeHtml(md))
    
    if $(obj).find('.js-post-markdown-preview').length > 0
      md = $(obj).data('markdown')
      $(obj).find('.js-post-markdown-preview').html(GhostTrain.front_markdown.makeHtml(md))

  )

