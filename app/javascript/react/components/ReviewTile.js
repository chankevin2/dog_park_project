import React from 'react'

const ReviewTile = (props) => {
  let thumb_up = `fa fa-thumbs-up thumb ${props.thumbs_up}`
  let thumb_down = `fa fa-thumbs-down thumb ${props.thumbs_down}`
  return(
    <div className="callout">
      <div>
        Rating: {props.rating}   <i onClick = {props.handleThumbsUpClick} className = {thumb_up}></i>
          <i onClick = {props.handleThumbsDownClick} className = {thumb_down}></i>
      </div>
      <div>
        Review: {props.body}
      </div>

    </div>
  )
}

export default ReviewTile
