do ->
  $(document).ready ->

    # Constants
    MARGIN_TOP = parseInt($('body').css('margin-top'), 10)

    # JQuery wrappers
    $viewPort = $('html,body')
    $window = $(window)

    # If the top of the panel is not visible, scroll towards it until the top of the panel is at the top of the view.
    # If the bottom of the panel is not visible, scroll down towards it until the top of the panel is at the top of 
    # the view or the panel is completely visible. If both are visible, do nothing.
    scrollIntoView = ($element) ->
      docViewTop = $window.scrollTop()
      docViewBottom = docViewTop + $window.height()

      elementTop = $element.offset().top
      elementBottom = elementTop + $element.height()

      topOnScreen = docViewTop + MARGIN_TOP < elementTop
      botOnScreen = docViewBottom > elementBottom

      if !topOnScreen
        animateScrollTo($element)
      else if !botOnScreen
        topSpace = $window.height() - $element.height() - MARGIN_TOP
        topSpace = 0 if topSpace < 0
        $viewPort.animate({ scrollTop: $element.offset().top - MARGIN_TOP - topSpace })

      return

    # Animate a scroll to an element so that the top of the element is aligned with the top of the view.
    animateScrollTo = ($element) ->
      $viewPort.animate({ scrollTop: $element.offset().top - MARGIN_TOP })
      return

    collapsePanel = ($panel) ->
      $panel.find('.panel-body').slideUp()
      $panel.find('.glyphicon-chevron-up').removeClass('glyphicon-chevron-up').addClass('glyphicon-chevron-down')
      $panel.addClass('collapsed')
      return

    expandPanel = ($panel, startCallback) ->
      $panel.find('.panel-body').slideDown
        start: startCallback
      $panel.find('.glyphicon-chevron-down').removeClass('glyphicon-chevron-down').addClass('glyphicon-chevron-up')
      $panel.removeClass('collapsed')
      return

    # Clicking on a dropdown panel header (collapse or expand accordingly).
    $('.drop-down-panel > .panel-heading').click (e) ->
      $panel = $(this).parent()
      if !$panel.hasClass('collapsed') then collapsePanel($panel) else expandPanel($panel, () -> scrollIntoView($panel))
      return

    # This function will animate a scroll to a panel and expand that panel if necessary when 
    # clicking on a ScrollSpy or inner page link. If clicking on an active ScrollSpy link, the link is flashed.
    $('#side-navbar a, #content a[href^="#"]').click (e) ->
      e.preventDefault()

      $panelContainer = $($(this).attr('href'))
      $panel = $panelContainer.children('.panel')

      $(this).fadeTo(200, .1).fadeTo(1000, 1) if $(this).parent().hasClass('active')
      animateScrollTo($panelContainer)
      expandPanel($panel) if $panel.hasClass('collapsed')
      return

    return # return from document.ready
  return # return from annonymous function wrap