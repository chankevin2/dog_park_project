import React from 'react'

const ReviewTile = (props) => {
  return(
    <div class="callout">
      <li>
        Rating: {props.rating} || Review: {props.body}
      </li>
    </div>
  )
}

export default ReviewTile
