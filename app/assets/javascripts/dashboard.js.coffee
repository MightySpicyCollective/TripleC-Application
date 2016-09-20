class window.Dashboard
  @$playerHolder: $('li .playerholder')
  @$audioBlock: $('.audio-block audio')

  @bindEvents: ->
    @_handleClickEvent()

  @_handleClickEvent: ->
    _this = @

    _this.$playerHolder.on 'click', (event) ->
      event.preventDefault()

      if($(this).hasClass('started'))
        _this._hideAudioBlock()
        _this._setAudioElement()
        _this.$audioBlock.trigger('stop')
        $(this).removeClass('started')
        $(this).find('.pause').addClass('hide')
        $(this).find('.play').removeClass('hide')
      else
        _this._showAudioBlock()
        _this._setAudioElement($(this).find('img').data('audio'))
        _this.$audioBlock.trigger('play')
        $(this).addClass('started')
        $(this).find('.play').addClass('hide')
        $(this).find('.pause').removeClass('hide')

  @_setAudioElement: (url = null) ->
    @$audioBlock.attr('src', url)

  @_hideAudioBlock: ->
    @$audioBlock.addClass('hide')

  @_showAudioBlock: ->
    @$audioBlock.removeClass('hide')

$ ->
  Dashboard.bindEvents()
