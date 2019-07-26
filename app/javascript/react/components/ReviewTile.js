import React from 'react'

const ReviewTile = (props) => {
  return(

    <div className="callout box">
        <div className="vote">Rating: {props.rating}</div>
        <div className="review">Review:</div> <div>{props.body}</div>
      <a href={`/parks/${props.park_id}/reviews/${props.id}/edit`}>Edit Review</a>
    </div>

  )
}

export default ReviewTile
