{CompositeDisposable} = require 'atom'
jsbeautify = (require 'js-beautify').js_beautify
cssbeautify = (require 'js-beautify').css
htmlbeautify = (require 'js-beautify').html

module.exports = VueFormat =
  vueFormatView: null
  modalPanel: null
  subscriptions: null

  activate: (state) ->

    # Events subscribed to in atom's system can be easily cleaned up with a CompositeDisposable
    @subscriptions = new CompositeDisposable

    # Register command that toggles this view
    @subscriptions.add atom.commands.add 'atom-workspace', 'vue-format:format': => @format()

  deactivate: ->
    @modalPanel.destroy()
    @subscriptions.dispose()
    @vueFormatView.destroy()

  serialize: ->


  format: (state) ->
    self = this
    console.log atom
    editor = atom.workspace.getActiveTextEditor()
    text = editor.getText()
    newTextArr = []
    ['css','html', 'js'].forEach((val, index) ->
      newText = self.replaceText(text, val)
      newTextArr.push(newText)
    )
    editor.setText(newTextArr.join('\n\n'))

  replaceText: (text, type) ->
    regObj = {
      css: /<style(\s|\S)*>(\s|\S)*<\/style>/gi,
      html: /<template(\s|\S)*>(\s|\S)*<\/template>/gi,
      js: /<script(\s|\S)*>(\s|\S)*<\/script>/gi
    }
    beautify = {
      css: cssbeautify,
      html: htmlbeautify,
      js: jsbeautify
    }
    contentRex = />(\s|\S)*<\//g

    if regObj[type].exec(text)
      console.log regObj[type].exec(text)
      typeText = regObj[type].exec(text)[0]
    else
      return ''

    if typeText
      typeTextCon = contentRex.exec(typeText)[0]
      typeContent = typeTextCon.substring(1).substr(0,typeTextCon.length - 3)
      typeArr = typeText.split(typeContent)
      beautifiedText = beautify[type](typeContent)
      console.log beautifiedText
      return typeArr[0] + '\n\n' + beautifiedText + '\n\n' + typeArr[1]
    else
      return ''
