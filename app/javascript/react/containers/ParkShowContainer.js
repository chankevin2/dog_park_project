import React, {Component } from "react";
import ParkShow from '../components/ParkShow'
import ReviewTile from '../components/ReviewTile'

class ParkShowContainer extends Component {
  constructor(props) {
    super(props);
    this.state ={
      park: {
        reviews: [],
        selectedThumbsUpId: null,
        selectedThumbsDownId: null
      }
    }
    this.handleReviewThumbsUpClick = this.handleReviewThumbsUpClick.bind(this)
    this.handleReviewThumbsDownClick = this.handleReviewThumbsDownClick.bind(this)
  }

  handleReviewThumbsUpClick( id ) {
    this.setState({selectedThumbsUpId: id, selectedThumbsDownId: null})
  }
  handleReviewThumbsDownClick (id) {
    this.setState({selectedThumbsDownId: id, selectedThumbsUpId: null})
  }

  updateVoteRating() {
    fetch()
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
      let thumbs_up = ''
      let thumbs_down = ''
      if(review.id === this.state.selectedThumbsUpId) {
        thumbs_up = "thumbs_up"
        thumbs_down = ""
      } else if(review.id === this.state.selectedThumbsDownId){
        thumbs_down = "thumbs_down"
        thumbs_up = ""
      }

      let thumbsUpClick = () => this.handleReviewThumbsUpClick(review.id)
      let thumbsDownClick = () => this.handleReviewThumbsDownClick(review.id)

      return(
        <ReviewTile
          key={review.id}
          rating={review.rating}
          body={review.body}
          handleThumbsUpClick={thumbsUpClick}
          handleThumbsDownClick={thumbsDownClick}
          thumbs_up={thumbs_up}
          thumbs_down={thumbs_down}
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
       <br></br>
       {reviewTiles}
      </div>
    )
  }
}
export default ParkShowContainer
