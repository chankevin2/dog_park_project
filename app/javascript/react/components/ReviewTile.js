import React from 'react'

const ReviewTile = (props) => {
  return(
    <div>
      <li>
        Rating: {props.rating} || Review: {props.body}
      </li>
    </div>
  )
}

export default ReviewTile
