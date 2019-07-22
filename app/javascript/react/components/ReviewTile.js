import React from 'react'

const ReviewTile = (props) => {
  return(
    <div>
      <p>Rating: {props.rating}</p>
      <p>Description: {props.body}</p>
    </div>
  )
}

export default ReviewTile
