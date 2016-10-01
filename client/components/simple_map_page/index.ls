react = require 'react'
GoogleMap = react.createFactory (require 'google-map-react').default
request = require 'request'

class SimpleMapPage extends react.Component
  
  ->
    state = 
      messages: {}

  getMessages: ->
    request 'http://www.google.com', (error, response, body) ->
      if !error and response.statusCode is 200
        console.log body


  render: ->
    GoogleMap {
      defaultCenter: {lat:59.938043, lng: 30.337157}
      defaultZoom: 9
    }


module.exports = SimpleMapPage
