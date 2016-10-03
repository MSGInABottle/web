require './index.styl'
react = require 'react'
{button, div, input} = react.DOM


class DropMessage extends react.Component
  render: ->
    div className: 'c-drop-message',
      input type: 'text'
      button {}


module.exports = DropMessage
