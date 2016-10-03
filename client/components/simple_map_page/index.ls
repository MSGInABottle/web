react = require 'react'
request = require 'request'
{div} = react.DOM
GoogleMapLoader = react.createFactory (require 'react-google-maps').GoogleMapLoader
GoogleMap = react.createFactory (require 'react-google-maps').GoogleMap
Marker = react.createFactory (require 'react-google-maps').Marker
ScriptjsLoader = react.createFactory require 'react-google-maps/lib/async/ScriptjsLoader'
InfoWindow = react.createFactory (require 'react-google-maps').InfoWindow

class SimpleMapPage extends react.Component
  
  ~>
    @getMessages!
    @getLocation!
    @state = 
      messages: []
      defaultCenter:
        lat: 43.474389
        lng: -80.531860


  getMessages: ->
    console.log 'Getting messages...'
    options =
      url: 'http://52.41.253.190:9000/messages/?latitude=43.474389&longitude=-80.531860'
      # url: 'http://127.0.0.1:9000/messages/?latitude=43.474389&longitude=-80.531860'    
    request options, (error, response, body) ~>
      if !error and response.statusCode is 200
        @setState messages: JSON.parse body
        setTimeout (~> @getMessages!), 1000


  getLocation: ~>
    if navigator.geolocation
      navigator.geolocation.getCurrentPosition (position) ~>
        @loc = lat: position.coords.latitude, lng: position.coords.longitude
        console.log "Current location is Lat: #{@loc.lat}, Lng: #{@loc.lng}"


  # TODO: toggle visibility of message onclick
  toggleVisible: (i) ~>
    console.log "toggling #{i}"
    messages = @state.messages
    for msg in messages
      if msg.i is i
        msg.visible = !msg.visible
        console.log 'found!'
    @setState messages: messages


  render: ~>
    ScriptjsLoader {
      hostname: 'maps.googleapis.com'
      pathname: '/maps/api/js'
      query: {v: '3.25', libraries: 'geometry,drawing,places', key: 'AIzaSyB8xO0V19hOpYQ_XIj-Gf-3em-C5cLowKM'}
      loadingElement: div {}, 'loading...'
      containerElement: div {style: height: '100%'}
      googleMapElement: GoogleMap {
        ref: (map) ->
        defaultCenter: @state.defaultCenter
        defaultZoom: 18
      }, 
        @state.messages.map (msg, i) ~>
          Marker {
            key: i
            position: lng: msg.Longitude, lat: msg.Latitude
            title: msg.Text
          }, 
            InfoWindow {},
              div {}, msg.Text
        Marker {
          position: @loc
          icon: require '../../images/user_location_marker.png'
          zIndex: 100
        }
    }
  
    
module.exports = SimpleMapPage
