class window.Search
  @$searchEl: $("#input")
  @$labelEl:  $("#label")

  @initialize: ->
    @_handleClickEvent()

  @_handleClickEvent: ->
    _this = @
    _this.$labelEl.on 'click', ->
      if(_this.$searchEl.hasClass('focus'))
        _this.$labelEl.removeClass('active')
        _this.$searchEl.removeClass('focus')
      else
        _this.$labelEl.addClass('active')
        _this.$searchEl.addClass('focus')

$ ->
  Search.initialize()
