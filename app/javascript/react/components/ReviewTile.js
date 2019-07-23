import React from 'react'

const ReviewTile = (props) => {
  return(
    <div className="callout">
      <li>
        Rating: {props.rating} || Review: {props.body}
      </li>
    </div>
  )
}

export default ReviewTile
