VueFormat = require '../lib/vue-format'
require 'fs'
[editor] = []

# Use the command `window:run-package-specs` (cmd-alt-ctrl-p) to run specs.
#
# To run a specific `it` or `describe` block add an `f` to the front (e.g. `fit`
# or `fdescribe`). Remove the `f` to unfocus the block.

describe "VueFormat", ->
  [workspaceElement, activationPromise] = []

  beforeEach ->
    workspaceElement = atom.views.getView(atom.workspace)
    return activationPromise = atom.workspace.open('specfiles/app.vue')

  describe "when the vue-format:format event is triggered", ->
    it "can format the whole buffer with the use of the command", ->
      waitsForPromise ->
        activationPromise.then (edit) -> editor=edit

      runs ->
        @fileText = atom.workspace.getActiveTextEditor().getText()
        atom.commands.dispatch(workspaceElement, 'vue-format:format');
        expect(editor).not.toBe(@fileText)
