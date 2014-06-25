{$} = require 'atom'
_ = require 'underscore-plus'
path = require 'path'
TabView = require atom.packages.resolvePackagePath('tabs') + '/lib/tab-view'

module.exports =
class SublimeTabView extends TabView

  initialize: (@item, @pane) ->
    super(@item, @pane)
    @addClass('temp') if @item.constructor.name is 'Editor'

    atom.workspaceView.command 'sublime-tabs:keep-tab', => @keepTab()

  updateModifiedStatus: ->
    if @item.isModified?()
      @addClass('modified') unless @isModified
      @removeClass('temp') if @is('.temp')
      @isModified = true
    else
      @removeClass('modified') if @isModified
      @isModified = false

  keepTab: ->
    @removeClass('temp') if @is('.temp')
