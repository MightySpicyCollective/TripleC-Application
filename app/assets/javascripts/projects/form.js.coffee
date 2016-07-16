//= require 'projects/base'
//= require 'ace/ace'
//= require 'ace/mode-ruby'
//= require 'ace/theme-textmate'
//= require 'ace/theme-xcode'
//= require 'jquery-ace.min'

class Projects.Form extends Projects

  @bindEvents: ->
    @_initializeCodeEditor()

  @_initializeCodeEditor: ->
    $('textarea[name="project[source_code]"].form-control').ace({theme: 'xcode', lang: 'ruby'})

$ ->
  Projects.Form.bindEvents()
