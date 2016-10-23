//= require 'best_in_place'
//= require 'projects/base'
//= require 'ace/ace'
//= require 'ace/mode-ruby'
//= require 'ace/theme-xcode'
//= require 'jquery-ace.min'

class Projects.Show extends Projects
  @$editInPlace: $('a.edit-in-place')
  @$playerHolder: $('.playerholder')
  @$audioBlock: $('.audio-block audio')

  @bindEvents: ->
    @_initializeBIP()
    @_handleClickEvent()
    @_handleAJAXSuccess()

  @_initializeBIP: ->
    $('.best_in_place').best_in_place()

  @_handleClickEvent: ->
    _this = @
    _this.$editInPlace.on 'click', (event) ->
      event.preventDefault()
      if _this.$editInPlace.hasClass('click-activated')
        _this.$editInPlace.removeClass('click-activated')
        _this._toggleEditView()
        _this._destroyCodeEditor()
      else
        _this.$editInPlace.addClass('click-activated')
        _this._toggleShowView()
        _this._initializeCodeEditor()

    _this.$playerHolder.on 'click', (event) ->
      event.preventDefault()

      if($(this).hasClass('started'))
        _this._hideAudioBlock()
        _this.$audioBlock.trigger('pause')
        $(this).addClass('paused')
        $(this).removeClass('started')
        $(this).find('.pause').addClass('hide')
        $(this).find('.play').removeClass('hide')
      else
        _this._showAudioBlock()
        _this.$audioBlock.attr('src', $(this).find('img').data('audio'))
        _this.$audioBlock.trigger('play')
        $(this).removeClass('paused')
        $(this).addClass('started')
        $(this).find('.play').addClass('hide')
        $(this).find('.pause').removeClass('hide')

    $(document).on 'click', '.update-code', ->
      _this._toggleEditView()

  @_showAudioBlock: ->
    $('.audio-block').removeClass('hide')

  @_hideAudioBlock: ->
    $('.audio-block').addClass('hide')

  @_handleAJAXSuccess: ->
    $('.project-source-code').bind 'ajax:success', ->
      window.location.reload()

  @_toggleEditView: ->
    $('.row.edit-project-code').addClass('hide')
    $('.row.project-code').removeClass('hide')
    @$editInPlace.removeClass('click-activated')

  @_toggleShowView: ->
    $('.row.edit-project-code').removeClass('hide')
    $('.row.project-code').addClass('hide')
    $('.row.edit-project-code span.best_in_place').click()

  @_initializeCodeEditor: ->
    $('textarea[name="source_code"].form-control').ace({theme: 'xcode', lang: 'ruby'})

$ ->
  Projects.Show.bindEvents()
