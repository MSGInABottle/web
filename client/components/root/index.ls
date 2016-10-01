react = require 'react'
Route = react.createFactory require 'react-router/lib/Route'
Router = react.createFactory require 'react-router/lib/Router'
Redirect = react.createFactory require 'react-router/lib/Redirect'
browserHistory = require 'react-router/lib/browserHistory'
MainPage = require '../main_page'


class Root extends react.Component

  render: ->
    Router history: browserHistory,
      Route path: '/', component: MainPage


module.exports = Root
