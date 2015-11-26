#vue-format package (https://github.com/LeslieYQ/vue-format)

![A screenshot of your package](https://f.cloud.github.com/assets/69169/2290250/c35d867a-a017-11e3-86be-cd7c5bf3ff9b.gif)

```bash
apm install vue-format
```

Or Settings/Preferences ➔ Packages ➔ Search for `vue-format`

## Language Support

- [x] Vue, including html, css(not stylus, less, scss) , js (es6)

## Usage

It will beautify .vue file for html,css and js

### Shortcut

You can also type `ctrl-alt-v` as a shortcut or click `Packages > vue-format` in the menu.

#### Custom Keyboard Shortcuts

See [Keymaps In-Depth](https://atom.io/docs/latest/behind-atom-keymaps-in-depth) for more details.

For example:

```coffeescript
'.editor':
  'ctrl-alt-b': 'atom-beautify:beautify-editor'
```

## Configuration

use js-beautify default

### Simple

See [examples/simple-jsbeautifyrc/.jsbeautifyrc](https://github.com/donaldpipowitch/atom-beautify/blob/master/examples/simple-jsbeautifyrc/.jsbeautifyrc).

```json
{
  "indent_size": 2,
  "indent_char": " ",
  "other": " ",
  "indent_level": 0,
  "indent_with_tabs": false,
  "preserve_newlines": true,
  "max_preserve_newlines": 2,
  "jslint_happy": true,
  "indent_handlebars": true
}
```

## License

[MIT](https://github.com/LeslieYQ/vue-format/LICENSE.md) © [LeslieYQ yuqiu](https://github.com/LeslieYQ)
