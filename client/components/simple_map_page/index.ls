react = require 'react'
GoogleMap = react.createFactory (require 'google-map-react').default
GoogleMapMarkers = react.createFactory (require 'google-map-react').default
Map = react.createFactory (require 'google-maps-react').default
request = require 'request'
{GoogleApiWrapper} = require 'google-maps-react'

class SimpleMapPage extends react.Component
  
  ~>
    @getMessages!
    @state = 
      messages: {}
      defaultCenter: {
        lat: 43.474389
        lng: -80.531860
      }

  getMessages: ->
    console.log 'sending request...'
    options =
      url: 'http://52.41.253.190:9000/messages/?latitude=119.123123&longitude=120.1222'
    
    request options, (error, response, body) ->
      console.log error
      if !error and response.statusCode is 200
        console.log body


  render: ~>
    # console.log @state.defaultCenter
    # GoogleMap {
    #   defaultZoom: 17
    #   center: @state.defaultCenter
    #   bootstrapURLKeys: key: 'AIzaSyB8xO0V19hOpYQ_XIj-Gf-3em-C5cLowKM'
    # }
    Map {
      google: @props.google
      zoom: 14
    }

module.exports = 
  GoogleApiWrapper({
    apiKey: 'AIzaSyB8xO0V19hOpYQ_XIj-Gf-3em-C5cLowKM'
  })(SimpleMapPage)
  
