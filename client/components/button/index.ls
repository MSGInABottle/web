react = require 'react'
request = (require 'request').default

Button = React.create-class do
  render: ->
    <input type="text"/>
    <button type="button" >Send</button>

module.exports = Button 