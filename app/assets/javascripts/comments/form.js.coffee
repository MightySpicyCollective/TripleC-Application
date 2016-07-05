//= require 'comments/base'

class Comments.Form extends Comments
  @$form: $('.new_comment')
  @bindEvents: ->
    @$form.on 'ajax:success', ->
      window.location.reload()

    @$form.on 'ajax:error', (event, response, code) ->
      $('.error').html(response.responseJSON.errors['content'].join(''))
$ ->
  Comments.Form.bindEvents()
