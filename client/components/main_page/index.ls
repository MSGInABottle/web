require './index.styl'
react = require 'react'
{div} = react.DOM
Container = react.createFactory require '../container'
SimpleMapPage = react.createFactory require '../simple_map_page'
DropMessage = react.createFactory require '../drop_message'

class MainPage extends react.Component
  render: ->
    div className: 'c-simple-map-page',
      SimpleMapPage {}
      DropMessage {}
    # Container {}, 'container'
    # div {} , 'hi'


module.exports = MainPage
