react = require 'react'
request = (require 'request').default



Button = React.create-class do
	@loc = {}
	getLocation: ->
		if navigator.geolocation
			navigator.geolocation.getCurrentPosition( position ->
            	@loc = 
              		lat: position.coords.latitude,
              		long: position.coords.longitude
            	
          	)

    sendPost: ->
    	console.log 'sending message...'
    	txt = document.getElementById("txt")
    	options =
    		method: 'POST',
      		url: 'http://52.41.253.190:9000/send/',
      		qs: '{"text":txt.value, "latitude":@loc.lat, "longitude": @loc.long}'
      		headers: 
      			"Content-Type": "application/json"
    
    	request options, (error, response, body) ->
      		if !error 
      			console.log error
      		else
        		console.log(response.statusCode,body)

    buttonClicked: ->
    	console.log 'button clicked...'
    	getLocation()
    	sendPost()

  	render: ->
    	<input type="text" id="txt"/>
    	<button type="button">Send</button>

module.exports = Button 