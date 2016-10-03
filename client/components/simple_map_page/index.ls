react = require 'react'
Map = react.createFactory (require 'google-maps-react').default
Marker = react.createFactory (require 'google-maps-react').Marker
request = require 'request'
{GoogleApiWrapper} = require 'google-maps-react'
{div} = react.DOM

class SimpleMapPage extends react.Component
  
  ~>
    @getMessages!
    @state = 
      messages: []
      defaultCenter: {
        lat: 43.474389
        lng: -80.531860
      }

  getMessages: ->
    console.log 'sending request...'
    options =
      url: 'http://52.41.253.190:9000/messages/?latitude=43.474389&longitude=-80.531860'
    
    request options, (error, response, body) ~>
      if !error and response.statusCode is 200
        @setState messages: JSON.parse body
        console.log @state.messages
        for msg in @state.messages
          console.log parseFloat msg.Latitude


  render: ~>
    Map {
      className: 'map'
      google: @props.google
      zoom: 14
      centerAroundCurrentLocation: true
    },
      for msg, i in @state.messages
        Marker {
          name: msg.Text
          key: i
          position: lat: msg.Latitude, lng: msg.Longitude
        }
    
module.exports = 
  GoogleApiWrapper({
    apiKey: 'AIzaSyB8xO0V19hOpYQ_XIj-Gf-3em-C5cLowKM'
  })(SimpleMapPage)
  
