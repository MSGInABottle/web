react = require 'react'
Map = react.createFactory require 'google-maps-react'
{GoogleApiWrapper} = require 'google-maps-react'
{div} = react.DOM

class Container extends react.Component
  render: ->
    if !@props.loaded
      div {}, 'Loading'
    else
      Map {
        google: @props.google
        style: {
          width: '100%'
          height: '100%'
          postition: 'relative'
        }
        className: 'map'
        zoom: 14
        containerStyle: {}
        centerAroundCurrentLocation: true
      }

module.exports = Container

# export default GoogleApiComponent{
#   apiKey: 'AIzaSyB8xO0V19hOpYQ_XIj-Gf-3em-C5cLowKM'
# } (Container)
