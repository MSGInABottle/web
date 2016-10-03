require './index.styl'
react = require 'react'
{button, div, input} = react.DOM
request = require 'request'


class DropMessage extends react.Component

  ->
    @loc = {}
    @getLocation!

  getLocation: ~>
    if navigator.geolocation
      navigator.geolocation.getCurrentPosition (position) ~>
        @loc = lat: position.coords.latitude, lng: position.coords.longitude
        console.log "Current location is Lat: #{@loc.lat}, Lng: #{@loc.lng}"


  sendPost: ~>
    console.log 'Dropping message...'
    txt = @refs.dropMsg.value

    obj = {
      text: txt
      latitude: @loc.lat
      longitude: @loc.lng
    }
    console.log "#{JSON.stringify(obj)}"
    options =
      method: 'POST'
      url: 'http://52.41.253.190:9000/send/'
      # url: 'http://127.0.0.1:9000/send/'
      body: JSON.stringify obj
    
    request options, (error, response, body) ->
      if !error 
        console.log error
      else
        console.log body

  render: ->
    div className: 'c-drop-message',
      input ref: 'dropMsg', type: 'text'
      button onClick: @sendPost



module.exports = DropMessage
