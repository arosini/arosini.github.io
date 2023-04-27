do ->
  $(document).ready ->

    # Constant values
    MARGIN_TOP = parseInt($('body').css('margin-top'), 10)

    # JQuery shortcuts
    $viewPort = $('html, body')

    # Animate scroll to links on the same page.
    $('#top-navbar a').click (e) ->
      e.preventDefault()
      href = $.attr(this, 'href')

      $viewPort.animate { scrollTop: $(href).offset().top - MARGIN_TOP}, 500, ->
        $viewPort.clearQueue()
        history.pushState({}, '', href);
        return
      return
  return
return