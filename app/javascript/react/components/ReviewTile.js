import React from 'react'

const ReviewTile = (props) => {
  return(
    <div className="callout">
      <li>
        Rating: {props.rating} || Review: {props.body}
      </li>
      <a href={`/parks/${props.park_id}/reviews/${props.id}/edit`}>Edit Review</a>
    </div>
  )
}

export default ReviewTile
