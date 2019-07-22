import React, { Component } from 'react'
import ReviewTile from '../components/ReviewTile'
import ReviewFormContainer from './ReviewFormContainer'

class ReviewIndexContainer extends Component {
  constructor(props) {
    super(props)
    this.state = {
      reviews: []
    }
    this.addNewReview = this.addNewReview.bind(this)
  }

  componentDidMount() {
    fetch('/api/v1/reviews')
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
          this.setState({reviews: body})
        })
        .catch(error => console.error(`Error in fetch: ${error.message}`));
  }

  addNewReview(formPayload){
    fetch('/api/v1/reviews', {
      method: 'POST',
      body: JSON.stringify(newReviewObject)
    })
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
          this.setState({reviews: this.state.reviews.concat(body)})
        })
        .catch(error => console.error(`Error in fetch: ${error.message}`));
  }

  render() {
    let reviews = this.state.reviews.map( review => {
      return(
        <ReviewTile
          key={review.id}
          rating={review.rating}
          body={review.body}
         />
      )
    })

      return(
        <div className="reviews">
        <h3>Reviews:</h3>
        {reviews}
        <ReviewFormContainer/>
        </div>
    )
  }
}

export default ReviewIndexContainer
