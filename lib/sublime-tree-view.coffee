{$} = require 'atom'

TreeView      = require atom.packages.resolvePackagePath('tree-view') + '/lib/tree-view'

module.exports =
class SublimeTreeView extends TreeView
  initialize: (state) ->
    super(state)

    @on 'dblclick', '.entry', (e) ->
      return if e.shiftKey || e.metaKey
      atom.workspaceView.find('.tab-bar .tab.active').removeClass('temp')

  entryDblClicked: (e) ->
    @selectedEntry = $(e.currentTarget).view()
    @openSelectedEntry(false, true)
