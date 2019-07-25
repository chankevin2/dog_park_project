import React, {Component } from "react";
import ParkShow from '../components/ParkShow'
import ReviewTile from '../components/ReviewTile'

class ParkShowContainer extends Component {
  constructor(props) {
    super(props);
    this.state ={
      park: {
        reviews: []
      }
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
    let reviewTiles = this.state.park.reviews.map (review => {
      return(
        <ReviewTile
        park_id={this.state.park.id}
        key={review.id}
        id={review.id}
        rating={review.rating}
        body={review.body}
         />
      )
    })
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

      <div className="wrapper">
       {reviewTiles}
       </div>
      </div>
    )
  }
}


export default ParkShowContainer
