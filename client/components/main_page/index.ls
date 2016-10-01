require './index.styl'
react = require 'react'
{div} = react.DOM
Container = react.createFactory require '../container'
SimpleMapPage = react.createFactory require '../simple_map_page'

class MainPage extends react.Component
  render: ->
    SimpleMapPage {}
    # Container {}, 'container'
    # div {} , 'hi'


module.exports = MainPage
