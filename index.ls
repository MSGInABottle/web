express = require 'express'
webpack = require 'webpack'
webpackDevMiddleware = require 'webpack-dev-middleware'


app = express!
app.listen process.env.PORT || 8000

app.use webpackDevMiddleware webpack require './webpack-config.ls'
# app.use (req, res, next) ->
#   # Website you wish to allow to connect
#   res.setHeader 'Access-Control-Allow-Origin', 'http://52.41.253.190:9000'

#   # Request methods you wish to allow
#   res.setHeader 'Access-Control-Allow-Methods', 'GET, POST, OPTIONS, PUT, PATCH, DELETE'

#   # Request headers you wish to allow
#   res.setHeader 'Access-Control-Allow-Headers', 'X-Requested-With,content-type'

#   # Set to true if you need the website to include cookies in the requests sent
#   # to the API (e.g. in case you use sessions)
#   res.setHeader 'Access-Control-Allow-Credentials', true

#   # Pass to next layer of middleware
#   next!

app.get '/*', (req, res) ->
  res.render 'main'

app.set 'view engine', 'pug'
app.set 'views', __dirname
