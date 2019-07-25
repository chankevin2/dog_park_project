import React, {Component } from "react";
import ReviewTile from '../components/ReviewTile'

class ReviewContainer extends Component {
  constructor(props) {
    super(props);
    this.state = {
      clickCounts: null
    }
    this.handleClick = this.handleClick.bind(this)
  }

    handleClick(event, reviewId) {
      let newClickCounts = this.state.clickCounts
      if (event.target.className.includes('fa-thumbs-up')){
        newClickCounts = this.state.clickCounts.map (clickCount => {
          let thumbsUpClickCountThis = clickCount.thumbsUpClickCount
          let thumbs_up_this = clickCount.thumbs_up
          if (reviewId == clickCount.id && clickCount.thumbsUpClickCount === 0) {
            thumbsUpClickCountThis = thumbsUpClickCountThis + 1
            thumbs_up_this = "thumbs_up"
          }
          return {
            id: clickCount.id,
            thumbsUpClickCount: thumbsUpClickCountThis,
            thumbsDownClickCount: 0,
            thumbs_up: thumbs_up_this,
            thumbs_down: 0
          }
        })
      } else if (event.target.className.includes('fa-thumbs-down')){
        newClickCounts = this.state.clickCounts.map (clickCount => {
          let thumbsDownClickCountThis = clickCount.thumbsDownClickCount
          let thumbs_down_this = clickCount.thumbs_down
          if (reviewId == clickCount.id && clickCount.thumbsDownClickCount === 0) {
            thumbsDownClickCountThis = thumbsDownClickCountThis + 1
            thumbs_down_this = "thumbs_down"
          }
          return {
            id: clickCount.id,
            thumbsUpClickCount: 0,
            thumbsDownClickCount: thumbsDownClickCountThis,
            thumbs_up: 0,
            thumbs_down: thumbs_down_this
          }
        })
      }
      this.setState({clickCounts: newClickCounts})
    }

  render() {
    if ((this.state.clickCounts == null) && (this.props.reviews.length > 0)) {
      let clickCountsInitial = this.props.reviews.map (review => {
        return {
          id: review.id,
          thumbsUpClickCount: 0, //0 for now; eventually need to read from db
          thumbsDownClickCount: 0, //0 for now; eventually need to read from db
          thumbs_up: "", // look this up in db to see if user already clicked
          thumbs_down: "" // look this up in db to see if user already clicked
        }
      })
      this.setState({clickCounts: clickCountsInitial})
    }

    if (this.state.clickCounts != null) {
      let reviewTiles = this.props.reviews.map (review => {

        let thumbs_up = this.state.clickCounts.find(x => x.id == review.id).thumbs_up
        let thumbs_down = this.state.clickCounts.find(x => x.id == review.id).thumbs_down
        let thumbsUpClickCount = this.state.clickCounts.find(x => x.id == review.id).thumbsUpClickCount
        let thumbsDownClickCount = this.state.clickCounts.find(x => x.id == review.id).thumbsDownClickCount
        let handleChangeReviewId =(event) => {
         this.handleClick(event, review.id)
        }

        return(
        <ReviewTile
          key={review.id}
          rating={review.rating}
          body={review.body}
          thumbsUpClickCount={thumbsUpClickCount}
          thumbsDownClickCount={thumbsDownClickCount}
          handleClick={handleChangeReviewId}
          thumbs_up={thumbs_up}
          thumbs_down={thumbs_down}
         />
        )
      })
      return(
        <div>
         {reviewTiles}
        </div>
      )
    } else {
      return null
    }
  }
}
export default ReviewContainer
