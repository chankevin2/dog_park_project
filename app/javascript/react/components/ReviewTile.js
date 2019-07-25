import React from 'react'

const ReviewTile = (props) => {
  // console.log(props)
  let thumb_up = `fa fa-thumbs-up thumb ${props.thumbs_up}`
  let thumb_down = `fa fa-thumbs-down thumb ${props.thumbs_down}`
  return(
    <div className="callout">
      <div>
        Rating: {props.rating}   <i onClick = {props.handleClick} className = {thumb_up}>{props.thumbsUpClickCount}</i>
          <i onClick = {props.handleClick} className = {thumb_down}>{props.thumbsDownClickCount}</i>
      </div>
      <div>
        Review: {props.body}
      </div>
      <a href={`/parks/${props.park_id}/reviews/${props.id}/edit`}>Edit Review</a>
    </div>
  )
}

export default ReviewTile
