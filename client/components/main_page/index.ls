require './index.styl'
react = require 'react'
{div} = react.DOM
SimpleMapPage = react.createFactory require '../simple_map_page'
DropMessage = react.createFactory require '../drop_message'

class MainPage extends react.Component
  render: ->
    div className: 'c-simple-map-page',
      SimpleMapPage {}
      DropMessage {}


module.exports = MainPage
