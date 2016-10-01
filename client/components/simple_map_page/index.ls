# import React, {PropTypes, Component} from 'react';
# import shouldPureComponentUpdate from 'react-pure-render/function';

# import GoogleMap from 'google-map-react';
# import MyGreatPlace from './my_great_place.jsx';

# export default class SimpleMapPage extends Component {
#   static defaultProps = {
#     center: {lat: 59.938043, lng: 30.337157},
#     zoom: 9,
#     greatPlaceCoords: {lat: 59.724465, lng: 30.080121}
#   };

#   shouldComponentUpdate = shouldPureComponentUpdate;

#   constructor(props) {
#     super(props);
#   }

#   render() {
#     return (
#        <GoogleMap
#         defaultCenter={this.props.center}
#         defaultZoom={this.props.zoom}>
#         # <MyGreatPlace lat={59.955413} lng={30.337844} text={'A'} /* Kreyser Avrora */ />
#         # <MyGreatPlace {...this.props.greatPlaceCoords} text={'B'} /* road circle */ />
#       </GoogleMap>
#     );
#   }
# }

react = require 'react'
# {PropTypes} = require 'react'
GoogleMap = react.createFactory require 'google-map-react'

class SimpleMapPage extends react.Component
  render: ->
    GoogleMap {
      defaultCenter: {lat:59.938043, lng: 30.337157}
      defaultZoom: 9
    }


module.exports = SimpleMapPage
