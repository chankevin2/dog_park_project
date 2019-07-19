import React from 'react'

const ReviewTile = (props) => {
  return(
    <div>
    <li>
      Rating: {props.rating} || Description: {props.body}
    </li>
    <br></br>
    </div>
  )
}

export default ReviewTile
