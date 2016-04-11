//= require 'registrations/base'

class window.Registrations.Form extends window.Registrations
  @schoolClassroomCombination: {}
  @$schoolSelect:       $('.school-select')
  @$classroomSelect:    $('.classroom-select')
  @$avatarUpload:       $('.upload-avatar')
  @$photoPreview:       $('.photoPreview')
  @$uploadAvatar:       $('input[type="file"]#uploadAvatar')
  @$avatarPlaceholder:  $('img.avatarPlaceholder')
  @$uploadClickLink:    $('a#uploadClick')
  @$deletePhoto:        $('.delete-photo')

  @bindEvents: ->
    @_handleClickEvent()
    @_handleChangeEvent()

  @_handleClickEvent: ->
    _this = @
    _this.$photoPreview.on 'click', (event) ->
      event.preventDefault()
      _this.$uploadAvatar.trigger('click')

    _this.$deletePhoto.on 'click', ->
      _this.$deletePhoto.addClass('hide');
      _this.$uploadAvatar.val('');
      _this.$avatarPlaceholder.addClass('hide').attr('src', '')
      _this.$photoPreview.addClass('upload-pic-bg')
      _this.$uploadClickLink.show();

  @_handleChangeEvent: ->
    _this = @
    _this.$schoolSelect.on 'change', ->
      $firstOption = _this.$classroomSelect.find('option').first()
      classroomValue = _this.$classroomSelect.val()
      $firstOption.siblings().remove()
      classRooms = _this.schoolClassroomCombination[@value]
      if classRooms
        classRooms.forEach (element) ->
          $opt = $('<option />').val(element[1]).text(element[0])
          _this.$classroomSelect.append($opt)
      _this.$classroomSelect.val(classroomValue)

    _this.$uploadAvatar.on 'change', ->
      _this.$photoPreview.removeAttr('disabled');
      _this.readURL(@);

    _this.$schoolSelect.trigger('change')
    _this.$classroomSelect.trigger('change')

  @readURL: (input) ->
    _this = @
    if (input.files && input.files[0])
      reader = new FileReader();

      reader.onload = (e) ->
        _this.$photoPreview.removeClass('upload-pic-bg')
        _this.$avatarPlaceholder.removeClass('hide').attr('src', e.target.result)
        _this.$uploadClickLink.hide();
      reader.readAsDataURL(input.files[0])
      _this.$deletePhoto.removeClass('hide')


$ ->
  Registrations.Form.bindEvents()
