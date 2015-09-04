do ->
  $(document).ready ->

    # Constant values
    MARGIN_TOP = parseInt($('body').css('margin-top'), 10)

    # JQuery shortcuts
    $viewPort = $('html, body')

    # Animate scroll to links on the same page.
    # TODO: Fix bug where if you spam a link, you can't scroll manually.
    $('a[href*=#]:not([href=#])').click ->
      href = $.attr(this, 'href')

      $viewPort.animate { scrollTop: $(href).offset().top - MARGIN_TOP}, 500, ->
        window.location.hash = href
        return
      false

  return
return