import React, {Component } from "react";
import ParkShow from '../components/ParkShow'

class ParkShowContainer extends Component {
  constructor(props) {
    super(props);
    this.state ={
      park: {}
    }
  }

  componentDidMount() {
    let id = this.props.match.params.id
    fetch(`/api/v1/parks/${id}`)
     .then(response => {
       if (response.ok) {
         return response;
       } else {
         let errorMessage = `${response.status} (${response.statusText})`,
             error = new Error(errorMessage);
         throw(error);
       }
     })
     .then(response => response.json())
     .then(body => {

       this.setState({park: body});
     })
     .catch(error => console.error(`Error in fetch: ${error.message}`));
  }

  render() {
    return(
      <div>
        <ParkShow
          id={this.state.park.id}
          name={this.state.park.name}
          description={this.state.park.description}
          address={this.state.park.address}
          city={this.state.park.city}
          state={this.state.park.state}
          zip={this.state.park.zip}
         />
      </div>
    )
  }
}


export default ParkShowContainer
