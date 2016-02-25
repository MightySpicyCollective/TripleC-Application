//= require 'best_in_place'
//= require 'projects/base'

class Projects.Show extends Projects
  @$editInPlace: $('a.edit-in-place')

  @bindEvents: ->
    @_initializeBIP()
    @_handleClickEvent()
    @_handleAJAXSuccess()

  @_initializeBIP: ->
    $('.best_in_place').best_in_place()

  @_handleClickEvent: ->
    _this = @
    @$editInPlace.on 'click', ->
      if _this.$editInPlace.hasClass('abc')
        _this.$editInPlace.removeClass('abc')
        _this._toggleEditView()
      else
        _this.$editInPlace.addClass('abc')
        _this._toggleShowView()

  @_handleAJAXSuccess: ->
    $('.project-source-code').bind 'ajax:success', ->
      window.location.reload()

  @_toggleEditView: ->
    $('.row.edit-project-code').addClass('hide')
    $('.row.project-code').removeClass('hide')

  @_toggleShowView: ->
    $('.row.edit-project-code').removeClass('hide')
    $('.row.project-code').addClass('hide')
    $('.row.edit-project-code span.best_in_place').click()


$ ->
  Projects.Show.bindEvents()
