react = require 'react'
Map = react.createFactory (require 'google-maps-react').default
# Marker = react.createFactory (require 'google-maps-react').Marker
# InfoWindow = react.createFactory (require 'google-maps-react').InfoWindow
request = require 'request'
{GoogleApiWrapper} = require 'google-maps-react'
{div} = react.DOM
GoogleMapLoader = react.createFactory (require 'react-google-maps').GoogleMapLoader
GoogleMap = react.createFactory (require 'react-google-maps').GoogleMap
Marker = react.createFactory (require 'react-google-maps').Marker
ScriptjsLoader = react.createFactory require 'react-google-maps/lib/async/ScriptjsLoader'
InfoWindow = react.createFactory (require 'react-google-maps').InfoWindow#/lib/addons/InfoWindow"

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


  render: ~>
    ScriptjsLoader {
      hostname: 'maps.googleapis.com'
      pathname: '/maps/api/js'
      query: {v: '3.25', libraries: 'geometry,drawing,places', key: 'AIzaSyB8xO0V19hOpYQ_XIj-Gf-3em-C5cLowKM'}
      loadingElement: div {}, 'loading...'
      containerElement: div {style: height: '100%'}
      googleMapElement: GoogleMap {
        ref: (map) -> console.log(map)
        defaultCenter: @state.defaultCenter
        defaultZoom: 18
      }, 
        @state.messages.map (msg, i) ->
          Marker {
            key: i
            position: lng: msg.Longitude, lat: msg.Latitude
            title: msg.Text
            onClick: -> console.log msg.Text
          }, 
            InfoWindow {},
              div {}, msg.Text
    }
    
    # Map {
    #   className: 'map'
    #   google: @props.google
    #   zoom: 14
    #   centerAroundCurrentLocation: true
    # },
    #   for msg, i in @state.messages
    #     Marker {
    #       name: msg.Text
    #       key: i
    #       position: lat: msg.Latitude, lng: msg.Longitude
    #       label: 'test'
    #     }
    
    
# module.exports = 
#   GoogleApiWrapper({
#     apiKey: 'AIzaSyB8xO0V19hOpYQ_XIj-Gf-3em-C5cLowKM'
#   })(SimpleMapPage)
  
module.exports = SimpleMapPage
