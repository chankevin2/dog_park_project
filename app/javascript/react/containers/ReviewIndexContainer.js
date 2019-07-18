import React, { Component } from 'react'
import ReviewTile from '../components/ReviewTile'

class ReviewIndexContainer extends Component {
  constructor(props) {
    super(props)
    this.state = {
      reviews: []
    }
  }

  render() {
    return(
      <div>
      <ReviewTile
      />

      <ReviewForm
      />
      </div>
    )
  }
}

export default ReviewIndexContainer
