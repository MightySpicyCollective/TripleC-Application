//= require 'registrations/base'

class window.Registrations.Form extends window.Registrations
  @schoolClassroomCombination: {}
  @$schoolSelect: $('.school-select')
  @$classroomSelect: $('.classroom-select')

  @bindEvents: ->
    _this = @
    @$schoolSelect.on 'change', ->
      $firstOption = _this.$classroomSelect.find('option').first()
      $firstOption.siblings().remove()
      classRooms = _this.schoolClassroomCombination[@value]
      if classRooms
        classRooms.forEach (element) ->
          $opt = $('<option />').val(element[1]).text(element[0])
          _this.$classroomSelect.append($opt)

$ ->
  Registrations.Form.bindEvents()
