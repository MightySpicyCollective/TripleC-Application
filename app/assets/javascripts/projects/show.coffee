//= require 'best_in_place'
//= require 'projects/base'

class Projects.Show extends Projects
  @$editInPlace: $('a.edit-in-place')

  @bindEvents: ->
    @_initializeBIP()
    @_handleClickEvent()
    @_handleAJAXSuccess()
    @_initializeLineNumbers()

  @_initializeBIP: ->
    $('.best_in_place').best_in_place()

  @_handleClickEvent: ->
    _this = @
    _this.$editInPlace.on 'click', (event) ->
      event.preventDefault()
      if _this.$editInPlace.hasClass('click-activated')
        _this.$editInPlace.removeClass('click-activated')
        _this._toggleEditView()
      else
        _this.$editInPlace.addClass('click-activated')
        _this._toggleShowView()

    $(document).on 'click', '.update-code', ->
      _this._toggleEditView()

  @_handleAJAXSuccess: ->
    $('.project-source-code').bind 'ajax:success', ->
      window.location.reload()

  @_initializeLineNumbers: ->
    pre = document.getElementsByTagName('pre')
    pl = pre.length
    i = 0
    while i < pl
      pre[i].innerHTML = '<span class="line-number"></span>' + pre[i].innerHTML + '<span class="cl"></span>'
      num = pre[i].innerHTML.split(/\n/).length
      j = 0
      while j < num
        line_num = pre[i].getElementsByTagName('span')[0]
        line_num.innerHTML += "<span>#{j + 1}</span>"
        j++
      i++

  @_toggleEditView: ->
    $('.row.edit-project-code').addClass('hide')
    $('.row.project-code').removeClass('hide')
    @$editInPlace.removeClass('click-activated')

  @_toggleShowView: ->
    $('.row.edit-project-code').removeClass('hide')
    $('.row.project-code').addClass('hide')
    $('.row.edit-project-code span.best_in_place').click()


$ ->
  Projects.Show.bindEvents()
